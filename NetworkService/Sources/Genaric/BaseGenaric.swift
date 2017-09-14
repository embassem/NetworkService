//
//  BaseGenaric.swift
//  NetworkService
//
//  Created by Bassem on 9/14/17.
//  Copyright © 2017 ADLANC. All rights reserved.
//

import Foundation

import ObjectMapper

public class BaseGenaric : NSObject, NSCoding, Mappable{
    
    var code: Int?
    var errors: [ServerError]?
    var messages: [String]?
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
        messages <- map["message"]
        status <- map["status"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required public init(coder aDecoder: NSCoder)
    {
        code = aDecoder.decodeObject(forKey: "code") as? Int
        errors = aDecoder.decodeObject(forKey: "errors") as? [ServerError]
        messages = aDecoder.decodeObject(forKey: "message") as? [String]
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
        if messages != nil{
            aCoder.encode(messages, forKey: "messages")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        
        
    }
}
