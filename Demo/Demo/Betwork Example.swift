//
//  Betwork Example.swift
//  Demo
//
//  Created by Bassem on 8/30/17.
//  Copyright © 2017 ADLANC. All rights reserved.
//

import Foundation
import NetworkService

// Example


class GithubProvider: NSObject  , ProviderProtocal {
    
    
    typealias Target = GitHub
    //    typealias ProviderTargetType = MoyaProvider<APITarget>
    var providerBaseUrl:String
    
    required init(baseUrl: String, plugins: [PluginType] , headers:[[String: String]]) {
        self.providerBaseUrl = baseUrl;
    }
    
    
    
    func changeBaseUrl() {
        
        
    }
    
    func getprovider() -> MoyaProvider<Target>  {
        
        let endpointClosure = { (target: Target) -> Endpoint<GitHub> in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
                .adding(newHTTPHeaderFields: ["X-Api-Key": "ABCD"])
                .adding(newHTTPHeaderFields: ["X-Api-Language": "AR"]);
            
            return defaultEndpoint
        }
        let token = ""
        let moyaProvider =  MoyaProvider<Target>(endpointClosure: endpointClosure,
                                                 plugins: [ APPNetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter),
                                                            AccessTokenPlugin(token: token )])
        
        return moyaProvider
    }
    
    
}
