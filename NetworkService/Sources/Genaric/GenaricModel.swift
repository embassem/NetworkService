//
//  GenaricModel.swift
//  NetworkService
//
//  Created by Bassem on 9/14/17.
//  Copyright © 2017 ADLANC. All rights reserved.
//

import Foundation
import ObjectMapper

public class GenaricModel<T:Mappable> : BaseGenaric{
    
    
    var responseObject: T?
    
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
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required public init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        responseObject = aDecoder.decodeObject(forKey: "data") as?  T
        
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
        
               
    }
}

