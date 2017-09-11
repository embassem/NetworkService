//
//	Competition.swift
//
//	Create by Bassem on 29/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import Realm
import RealmSwift
import ObjectMapper_Realm

class Competition : Object, NSCoding, Mappable{

	var href : String?


	class func newInstance(map: Map) -> Mappable?{
		return Competition()
	}
	required init?(map: Map){
    
     super.init();
    
    }
	internal required init(){
    
     super.init();
    
    }

    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
        
    }
    
	func mapping(map: Map)
	{
		href <- map["href"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        super.init();
         href = aDecoder.decodeObject(forKey: "href") as? String

	}
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
 

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if href != nil{
			aCoder.encode(href, forKey: "href")
		}

	}

}
