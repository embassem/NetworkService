//
//  AuthonticationProvider.swift
//  Guest-iOS
//
//  Created by Bassem on 7/9/17.
//  Copyright © 2017 Ibtikar. All rights reserved.
//

import Foundation

import Moya
import Moya_ObjectMapper
import Alamofire


enum MoiaAPI {
    case getAboutProgram(lang:String)

 
   
}

extension MoiaAPI: TargetType ,AccessTokenAuthorizable{

    /// The target's base `URL`.
    public var baseURL: URL{
        
        switch self {
       
        default:
             return URL(string: "http://www.kingguests.gov.sa")!
        }
       
    }
    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {
        
        switch self {

       
        case .getAboutProgram(lang: let lang):
           
            return "/sites/en/AboutTheProgram/About/_layouts/15/GetAbout.ashx"
            break;
        }
        
       
        
    }
    
    /// The HTTP method used in the request.
    public var method: Moya.Method {
        
        switch self {
      
        case .getAboutProgram(lang:_) :
            return .get
        default:
            return .post
        }
    }
    
    /// The parameters to be incoded in the request.
    public var parameters: [String: Any]? {
        //FIXME: Add language as a query to all filed
      
        
            return nil;
        
    }
    
    /// The method used for parameter encoding.
    public var parameterEncoding: ParameterEncoding {
        
       
            return URLEncoding.default
        
        
    }
    
    
    public var shouldAuthorize: Bool {
       
            return false;
        
    }
    
    /// Provides stub data for use in testing.
    public var sampleData: Data {
        switch self {
            
        default:
            return "API.".data(using: String.Encoding.utf8)!
        }
        
    }
    
    /// The type of HTTP task to be performed.
    public var task: Task {
        
        switch self {
            
        default:
            return .request
        }
        
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    public var validate: Bool {
        
        switch self {
            
        default:
            return true
        }
        
        
    }
    
    
    
    
}


// MARK: - Provider setup

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}


// MARK: - Provider support

//public struct TokenEncoding: ParameterEncoding {
//    public let param: LoginModel
//    private let urlEncoding = URLEncoding(destination: .methodDependent)
//    
//    init(login: LoginModel) {
//        self.param = login
//    }
//    
//    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
//        // use URLEncoding to encoding parameters
//        // use something like URLEncoding's implementation to add token to URL.
//        // URLEncoding can be found here: https://github.com/Alamofire/Alamofire/blob/master/Source/ParameterEncoding.swift#L70
//        var request = try urlRequest.asURLRequest()
//    
//        request.httpBody = param.toJSONString()?.data(using: .utf8, allowLossyConversion: false)
//        return request
//        
//    }
//}


extension String: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

