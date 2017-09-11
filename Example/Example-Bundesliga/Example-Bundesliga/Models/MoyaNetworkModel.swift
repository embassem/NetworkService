//
//  MoyaNetworkModel.swift
//  Bundesliga
//
//  Created by Bassem on 1/29/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper




class MoyaNetworkLModel {
    

    // MARK: - Provider setup
    
   
    
    let Provider = MoyaProvider<BundesligaEndPoints>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])
    
    // MARK: - Provider support
    
    
}

extension MoyaNetworkLModel:RemoteDataStorageProtocal{
    
    
    //Get teams for Comptition
    func getTeamsForComptition(comptitionId:Int,callback: @escaping ((Bool, Any) -> ())) {
        
        
     Shared.HUD.showProgressHUD(title: nil, subTitle: "loading ...")
        
        Provider.request(.getTeamsForComptitions(comptitionId)) { (result) in
            
            Shared.HUD.HideHud(after: 1)
            
            switch result {
            case let .success(moyaResponse):
                do {
                    let response = try moyaResponse.mapObject(TeamsDataModel.self)
                    
                    if (moyaResponse.statusCode == 200 ){
                        response.competitionId = comptitionId;
                    callback(false,response);
                    }else {
                        
                        let json = try moyaResponse.mapJSON();
                        
                        callback(true,json);
                    }
                   
                    
                } catch {
                    callback(true,"Failed to Parse Response");
                }
                
            case let .failure(error):
                guard let _error = error as? CustomStringConvertible else {
                     callback(true,error.errorDescription ?? "Request Error");
                    break
                }
                 callback(true,_error.description);
            }
            
         
            
                
                
                
            
        }
        
    }
    
    
    
    // Gat Player for Team
    func getPlayersforTeam(teamId: String, callback: @escaping ((Bool, Any) -> ())) {
        
        Shared.HUD.showProgressHUD(title: nil, subTitle: "loading ...")
        Provider.request(.getPlayersForTeam(teamId: teamId)) { (result) in
            
            Shared.HUD.HideHud(after: 1)
            switch result {
               
            case let .success(moyaResponse):
                do {
                    let response = try moyaResponse.mapObject(PlayersDataModel.self)
                    
                    if (moyaResponse.statusCode == 200 ){
                        
                      
                        callback(false,response);
                    }else {
                        
                        let json = try moyaResponse.mapJSON();
                        
                        callback(true,json);
                    }
                    
                    
                } catch {
                    callback(true,"Failed to Parse Response");
                }
                
            case let .failure(error):
                guard let _error = error as? CustomStringConvertible else {
                    callback(true,error.errorDescription ?? "Request Error");
                    break
                }
                callback(true,_error.description);
            }
            
            
            
            
            
            
            
        }

        
    }
    
   
    
}











private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}





    


    
    
    
    
    
