//
//  ClientService.swift
//  Guest-iOS
//
//  Created by Bassem on 7/9/17.
//  Copyright © 2017 Ibtikar. All rights reserved.
//

import Foundation
import Moya
import Moya_ObjectMapper
import Alamofire



 enum IbtikarAPI {

    case aboutProgram

}


extension IbtikarAPI: TargetType, AccessTokenAuthorizable  {

    

    /// The target's base `URL`.
    public var baseURL: URL { return URL(string: "http://kgapps.moia.gov.sa")! }


    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {

        switch self {
            
      

        case .aboutProgram:
            return "/api/guest/aboutProgram"

     
        }

    }

    /// The HTTP method used in the request.
    public var method: Moya.Method {

        switch self {

      default:
            return  .get
        }
    }

    /// The parameters to be incoded in the request.
    public var parameters: [String: Any]? {
        switch self {

        default:
            return nil
        }
    }

    /// The method used for parameter encoding.
    public var parameterEncoding: ParameterEncoding {

        switch self {
       
        default:
            return URLEncoding.default
        }

    }

    public var shouldAuthorize: Bool {
       

       
            return false
            
       
        
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
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}


// MARK: - Provider support



private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}


