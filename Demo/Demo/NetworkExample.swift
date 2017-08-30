//
//  Betwork Example.swift
//  Demo
//
//  Created by Bassem on 8/30/17.
//  Copyright © 2017 ADLANC. All rights reserved.
//

import Foundation
import NetworkService
import Moya
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
        
        let endpointClosure = { (target: Target) -> Endpoint<Target> in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
//                .adding(newHTTPHeaderFields: ["X-Api-Key": "ABCD"])
//                .adding(newHTTPHeaderFields: ["X-Api-Language": "AR"]);
            
            return defaultEndpoint
        }
        let token = ""
        let moyaProvider =  MoyaProvider<Target>(endpointClosure: endpointClosure,
                                                 plugins: [ NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter) ])//,
//                                                            AccessTokenPlugin(token: token )])
        
        return moyaProvider
    }
    
    
}


class ibtikarProvider: NSObject  , ProviderProtocal {
    
    
    typealias Target = IbtikarAPI
    //    typealias ProviderTargetType = MoyaProvider<APITarget>
    var providerBaseUrl:String
    
    required init(baseUrl: String, plugins: [PluginType] , headers:[[String: String]]) {
        self.providerBaseUrl = baseUrl;
    }
    
    
    
    func changeBaseUrl() {
        
        
    }
    
    func getprovider() -> MoyaProvider<Target>  {
        
        let endpointClosure = { (target: Target) -> Endpoint<Target> in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
                            .adding(newHTTPHeaderFields: ["X-Api-Key": "BNZrYUfnqkBNZOhx2u1wonkBrYpnqkBNZrYOhxl"])
            //                .adding(newHTTPHeaderFields: ["X-Api-Language": "AR"]);
            
            return defaultEndpoint
        }
      
        let moyaProvider =  MoyaProvider<Target>(endpointClosure: endpointClosure,
                                                 plugins: [ NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter) ])//,
        //                                                            AccessTokenPlugin(token: token )])
        
        return moyaProvider
    }
    
    
}

class MOIAProvider: NSObject  , ProviderProtocal {
    
    
    typealias Target = MoiaAPI
    //    typealias ProviderTargetType = MoyaProvider<APITarget>
    var providerBaseUrl:String
    
    required init(baseUrl: String, plugins: [PluginType] , headers:[[String: String]]) {
        self.providerBaseUrl = baseUrl;
    }
    
    
    
    func changeBaseUrl() {
        
        
    }
    
    func getprovider() -> MoyaProvider<Target>  {
        
        let endpointClosure = { (target: Target) -> Endpoint<Target> in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            //                .adding(newHTTPHeaderFields: ["X-Api-Key": "ABCD"])
            //                .adding(newHTTPHeaderFields: ["X-Api-Language": "AR"]);
            
            return defaultEndpoint
        }
        
        let moyaProvider =  MoyaProvider<Target>(endpointClosure: endpointClosure,
                                                 plugins: [ NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter) ])//,
        //                                                            AccessTokenPlugin(token: token )])
        
        return moyaProvider
    }
    
    
}






