//
//  WrapperError.swift
//  NetworkService
//
//  Created by Bassem on 9/14/17.
//  Copyright © 2017 ADLANC. All rights reserved.
//

import Foundation
import ObjectMapper


//{“errors”:[{"code":99,“label”:“authenticity_token_error”,“message”:“Unable to verify your credentials”}]}

public class ServerError : NSObject, NSCoding, Mappable , Error{
    
    var code : Int?
    var key : String?
    var message : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return ServerError()
    }
    required public init?(map: Map){}
    private override init(){}
    
    public func mapping(map: Map)
    {
        code <- map["code"]
        key <- map["label"]
        message <- map["message"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required public init(coder aDecoder: NSCoder)
    {
        code = aDecoder.decodeObject(forKey: "code") as? Int
        key = aDecoder.decodeObject(forKey: "label") as? String
        message = aDecoder.decodeObject(forKey: "message") as? String
        
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
        if key != nil{
            aCoder.encode(key, forKey: "label")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        
    }
    
}

