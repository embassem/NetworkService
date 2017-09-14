//
//  NetworkAbstraction.swift
//  Guest-iOS
//
//  Created by Bassem on 8/17/17.
//  Copyright © 2017 Ibtikar. All rights reserved.
//

//TODO: List
// - Cancelable
// hock to response to check on failure

import Foundation
import Alamofire
import Moya
import ObjectMapper
import SwiftyJSON
import Moya_ObjectMapper

import enum Result.Result

//============================================================================
//============================================================================
//MARK: -Protocal
public protocol ProviderProtocal  {
    
    associatedtype Target:TargetType;
//    associatedtype ProviderTargetType:MoyaProvider<APITarget>
    
    var providerBaseUrl :String{get set}
    
    init(baseUrl: String , plugins :  [PluginType] ,headers:[[String: String]] )
    mutating func changeBaseUrl()
    
    func getprovider() -> MoyaProvider<Target>
}





//============================================================================
//============================================================================
//MARK: - typealias


public typealias networkResult = Result<Mappable?, MoyaError>
public typealias NetworkResponse = (_ result: networkResult , _ json:JSON? , _ response: Moya.Response? , _ type:NetworkResponseType ) -> Void;




//============================================================================
//============================================================================
//MARK: - enum

public enum NetworkResponseType{
    case object
    case array
    case image
    case string
    
}




//============================================================================
//============================================================================
//MARK: - TypeProvider

public class TypeProvider<T:TargetType , M:Mappable> {
    
    var genaricModelType:M
    var target:T
    
    init(moyaTarget:T,genaricModelType:M) {
        self.genaricModelType = genaricModelType;
        self.target = moyaTarget;
    }
}


//============================================================================
//============================================================================
//MARK: - NetworkAbstractionService



public class NetworkService: NSObject {
    
  public  static let shared: NetworkService = {
        let instance = NetworkService()
        return instance
    }()
    
    
    public class func config(providers :[Any] ) {
       
        NetworkService.providers = providers;
        
    }
    
   private static  var providers :[Any] = []
    
    
    
    
    func reAuthAllPoint(){
        

        
    }
    
    
    public func request<E:TargetType, T:Mappable>(endPoint: E,modelType:T.Type,responseType:NetworkResponseType = .object, delegate: @escaping NetworkResponse) where E:TargetType {
        
        
         let targetproviders = NetworkService.providers.flatMap{ $0 as? MoyaProvider<E> }
        
        
            if let provider = targetproviders.first {
                provider.request(endPoint) { moyaResult in
            
                    self.responseHandeler(moyaResult, modelType: modelType,responseType, delegate: delegate)
        }
        
            }else {
                delegate(Result.failure(MoyaError.underlying(NSError(domain: "", code: -999), nil)), nil, nil, responseType);
        }
        
    }
    
    private func responseHandeler <T:Mappable>(_ result: Result<Moya.Response, Moya.MoyaError> , modelType: T.Type, _ responseType:NetworkResponseType , delegate: @escaping NetworkResponse )  where T: Mappable  {
        
        
        switch result {
        case let .success(response):
            
            self.successHandler(modelType, response: response, delegate: delegate)
            
            break
            
        case let .failure(error):
            
            
            self.failureHandler(modelType, error: error, response: nil, delegate: delegate)
            
        }
        
        
    }
    
    
    private func successHandler<T:Mappable> (_ modelType: T.Type , response: Moya.Response , _ type:NetworkResponseType = .object, delegate: @escaping NetworkResponse){
        
        
        var json: JSON? = nil;
        var model: Mappable? = nil;
        do {
            json = JSON(data: response.data);
            
            switch type {
            case .object:
                
                model =  try response.mapObject(GenaricModel<T>.self)
                
                
                break;
            case .array:
                model =  try response.mapObject(GenaricModel<T>.self)
                //                 model =  try response.mapArray(GenaricArray<modelType.Type>.self);
                //                 model =  try response.mapArray(GenaricModel<T>.self);
                
                
                break;
                
            default :
                fatalError(" requesting to map Network response to type not implemented ")
                break;
            }
            
            
        } catch let parseError {
            
            debugPrint(parseError.localizedDescription)
            
            //             delegate(.failure(parseError), json, response, type)
        }
        
        //        delegate(json, model, response);
        
        delegate(.success(model), json, response, type)
        
    }
    
    
    private func failureHandler<T:Mappable> (_ modelType: T.Type ,error: MoyaError ,response: Moya.Response? , _ type:NetworkResponseType = .object, delegate: @escaping NetworkResponse)  where T: Mappable {
        
        var json: JSON? = nil;
        var model: Mappable? = nil;
        do {
            if  let data  = response?.data {
                json = JSON(data: data);
                
            }
            model =  try response?.mapObject(GenaricModel<T>.self);
            
            
            
        } catch let parseError {
            
            debugPrint(parseError.localizedDescription)
            
            //          delegate(.failure(parseError), json, response, type)
        }
        
        
        
        
        delegate( Result<Mappable?, MoyaError>.failure(error), json, response, type)
        
        
        
    }
   
    
    
}









// MARK: - Provider setup

public  func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}


// MARK: - Provider support



public  extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}


