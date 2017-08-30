//
//  NetworkServiceError.swift
//  Guest-iOS
//
//  Created by Bassem on 8/30/17.
//  Copyright © 2017 Ibtikar. All rights reserved.
//

import Foundation
import Moya

public enum NetworkServiceError: Swift.Error {
   
    //MARK : - Copied from Moay Error
    
    /// Indicates a response failed to map to an image.
    case imageMapping(Response)
    
    /// Indicates a response failed to map to a JSON structure.
    case jsonMapping(Response)
    
    /// Indicates a response failed to map to a String.
    case stringMapping(Response)
    
    /// Indicates a response failed with an invalid HTTP status code.
    case statusCode(Response)
    
    /// Indicates a response failed due to an underlying `Error`.
    case underlying(Swift.Error, Response?)
    
    /// Indicates that an `Endpoint` failed to map to a `URLRequest`.
    case requestMapping(String)
    
//MARK : - Custom Errors
    
    /// Indicates that an `Provider` was not found for `TargetType`.
    case providerNotFound(String)
    
    /// Indicates any custom error.
    case customError(Swift.Error )
}

public extension NetworkServiceError {
    /// Depending on error type, returns a `Response` object.
    var response: Moya.Response? {
        switch self {
        case .imageMapping(let response): return response
        case .jsonMapping(let response): return response
        case .stringMapping(let response): return response
        case .statusCode(let response): return response
        case .underlying(_, let response): return response
        case .requestMapping: return nil
        // Custom Errors
        case .providerNotFound: return nil
        case .customError(_ ): return nil
        }
    }
}

// MARK: - Error Descriptions

extension NetworkServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .imageMapping:
            return "Failed to map data to an Image."
        case .jsonMapping:
            return "Failed to map data to JSON."
        case .stringMapping:
            return "Failed to map data to a String."
        case .statusCode:
            return "Status code didn't fall within the given range."
        case .requestMapping:
            return "Failed to map Endpoint to a URLRequest."
        case .underlying(let error, _):
            return error.localizedDescription

            // Custom Errors
        case .providerNotFound:
            return "Failed to found a provider that match TargetType ."
        case .customError(let error):
            return error.localizedDescription 
        }
    }
}
