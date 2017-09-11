//
//  Repository.swift
//  Bundesliga
//
//  Created by Bassem on 1/29/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import Foundation


struct Repository {
    
    
    var localDataStoreaage:LocalDataStorageProtocal!
    var remoteDataStorage:RemoteDataStorageProtocal!
    
    init(LocalDataStoreage:LocalDataStorageProtocal,RemoteDataStorage:RemoteDataStorageProtocal) {
        self.localDataStoreaage = LocalDataStoreage;
        self.remoteDataStorage = RemoteDataStorage;
    }
    
    
    
    
    
}


extension  Repository : TeamsRepositoryProtocal {
  
    
    
     // implement teams Protocal
    // get teams data depend on prefred stats"local , remote "
    internal func getTeamsForComptition(comptitionId: Int, withPrefeared: RepositoryPrefaredStorage, callback: @escaping ((Any) -> ())) {

    
        var result:Any?
        
        // get data from remote server as a func to use for multi call
        func doRemote() {
            remoteDataStorage.getTeamsForComptition(comptitionId: comptitionId, callback: { (error, remoteResult) in
                
                guard error == false else {
                    
                    print("Failed to get Data From Remote Storage for Request <<getTeamsForComptitions>> with error : " + "\(remoteResult)")
                    return;
                }
                
                
                // if return data save  save it in local storage for next retrieve
                
                if let teamDataModel =  remoteResult as? TeamsDataModel {
                    
                    let saveResult = self.localDataStoreaage.saveComptitionTeamsDatatoLocal(comptition: teamDataModel)
                    
                    callback(teamDataModel);
                }
                
                
                
            })
            
            
        }
        
        
        //get data from local  in a func 
        //return optional teamDataModel 
        //retun nil if not exist in local storage
        func doLocal() -> TeamsDataModel?{
            
         return   localDataStoreaage.getTeamComptition(comptitionId: comptitionId)
        }

        
        
        
        
        switch withPrefeared {
            
            
            
        case .local:
            
            if let teamDataModel =    doLocal() {
                
            callback(teamDataModel);
            }else {
                debugPrint("Failed to get Data From Local Storage")
                  callback("Failed to get Data From Local Storage");
            }
            
            break;
            
            
        case .remote:
            //Get the Data From server
         
            doRemote()
            
            break;
            
        default:
           // in default we will try get the data from local  if it is there if not  we will  request the new data
           //after new data get back we will update local data and update user interface
       
            
            
            if let result =  doLocal() {
                callback(result);
                
            }else {

               doRemote()
                
            }

            
         

            
            break;
        }

        
        
        
    }
}




extension Repository : PlayesRepositoryProtocal{
    
    
    internal func getPlayersForTeam(teamId: String, withPrefeared: RepositoryPrefaredStorage, callback: @escaping ((Any) -> ())) {

        
        var result:Any?
       
        
        func doRemote() {
            remoteDataStorage.getPlayersforTeam(teamId: teamId) { (error, remoteResult) in
                
           
                
                guard error == false else {
                    
                    print("Failed to get Data From Remote Storage for Request <<getPlayersForTeam>> with error : " + "\(remoteResult)")
                    return;
                }
                
                
                // if return data save  save it in local storage for next retrieve
                
                if let playersDataModel =  remoteResult as? PlayersDataModel {
                    
                                    
                    callback(playersDataModel);
                }
                
                
                
            }
            
            
        }
        
        
        
        
        
        
        //support get data from remote server only
        switch withPrefeared {
            
            
        case .remote:
            //Get the Data From server
            
            doRemote()
            
            break;
            
        default:
            //support get data from remote server only 

                doRemote()

            
            break;
        }
        

        
        
    }
    
}
