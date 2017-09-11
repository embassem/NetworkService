//
//  BundesligaEndPoints.swift
//  Bundesliga
//
//  Created by Bassem on 1/29/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import Moya_ObjectMapper

public enum BundesligaEndPoints {
    case getTeamsForComptitions(Int)
    
    case getPlayersForTeam(teamId:String)
}


extension BundesligaEndPoints: TargetType {
  
    
    
    
   
    public var baseURL: URL { return URL(string: "https://api.football-data.org")! }
    
    
    public var path: String {
        switch self {
        case .getTeamsForComptitions(let comp):
            return "/v1/competitions/\(comp)/teams"
            
        case .getPlayersForTeam(let teamId):
            
            
            return "/v1/teams/\(teamId)/players"
            
        }
        
    }
    
        
        
         public var method: Moya.Method {
            switch self {
            default:
                return .get
            }
        }

        
        
        public var parameters: [String: Any]? {
            let param :[String:Any] = [:];
            switch self {
                
                
            default:
                return param;
            }
        }
        
        
        public var parameterEncoding: ParameterEncoding {
            return URLEncoding.default
        }
        
        
        
        public var sampleData: Data {
            switch self {
            default:
                return "".data(using: String.Encoding.utf8)!
            }
        }
        
        
        public var task: Task {
            
            switch self {
                
            default:
                return .request
            }
            
        }
        public var validate: Bool {
            switch self {
                
            default:
                return false
            }
        }
        
    }





//    private func url(_ route: TargetType) -> String {
  //      return route.baseURL.appendingPathComponent(route.path).absoluteString
   // }
    



private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

