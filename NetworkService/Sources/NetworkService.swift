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
//MARK: - NetworkAbstractionService


public class NetworkService: NSObject {
    
  public  static let shared: NetworkService = {
        let instance = NetworkService()
        return instance
    }()
    
    
    public class func config(providers :[Any] ) {
       
        NetworkService.providers = providers;
        
    }
    
   private static  var providers :[Any] = [] //= [IbtikarProvider(serverUrl: ibtikarBaseUrl).provider!]
    
    
    
    
    func reAuthAllPoint(){
        
//        self.provider = IbtikarProvider(serverUrl: ibtikarBaseUrl).provider!;
        
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
            
//            let networkError = error as! NetworkServiceError
            
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
    
    
    
    
//    func authtoIbtikar(MOIALogin: MOIALoginResponse, delegate: @escaping NetworkResponse) {
//        
//        self.provider.request(.getAuthToken(MOIALogin.user)) { moyaResponse in
//            
//            switch moyaResponse {
//            case let .success(response):
//                
//                self.successHandler(IbtikarLoginResponse.self, response: response, delegate: delegate)
//                
//                break
//                
//            case let .failure(error):
//                
//                self.failureHandler(IbtikarLoginResponse.self, error: error, response: nil, delegate: delegate)
//                
//            }
//        }
//        
//    }
    
    
    
    
    
    
    
    
    
    
}





public class GenaricModel<T:Mappable> : BaseGenaric{
    
    
    var responseObject: T?
    var responseArray: [T]?
    
    override class func newInstance(map: Map) -> Mappable?{
        return GenaricModel<T>()
    }
    required public init?(map: Map){
        super.init(map: map)
    }
    override init(){
        super.init()
    }
    
    override public func mapping(map: Map)
    {
        
        responseObject <- map["data"]
        responseArray <- map["data"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required public init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        responseObject = aDecoder.decodeObject(forKey: "data") as?  T
        responseArray = aDecoder.decodeObject(forKey: "data") as?  [T]
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc override public func encode(with aCoder: NSCoder)
    {
        super.encode(with: aCoder)
        
        if responseObject != nil{
            aCoder.encode(responseObject, forKey: "data")
        }
        
        if responseObject != nil{
            aCoder.encode(responseObject, forKey: "data")
        }
        
    }
}


public class BaseGenaric : NSObject, NSCoding, Mappable{
    
    var code: Int?
    var errors: [String]?
    var message: String?
    var status: String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return BaseGenaric()
    }
    required public init?(map: Map){}
    override init(){}
    
    public func mapping(map: Map)
    {
        code <- map["code"]
        errors <- map["errors"]
        message <- map["message"]
        status <- map["status"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required public init(coder aDecoder: NSCoder)
    {
        code = aDecoder.decodeObject(forKey: "code") as? Int
        errors = aDecoder.decodeObject(forKey: "errors") as? [String]
        message = aDecoder.decodeObject(forKey: "message") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
        
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc public func encode(with aCoder: NSCoder)
    {
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if errors != nil{
            aCoder.encode(errors, forKey: "errors")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        
        
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


