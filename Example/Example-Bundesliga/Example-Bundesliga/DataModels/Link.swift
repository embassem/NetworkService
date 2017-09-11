//
//	Link.swift
//
//	Create by Bassem on 29/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import Realm
import RealmSwift
import ObjectMapper_Realm

class Link : Object, NSCoding, Mappable{

	var competition : Competition?
	var link : Competition?
	var fixtures : Competition?
	var players : Competition?
    var team : Competition?

	class func newInstance(map: Map) -> Mappable?{
		return Link()
	}
	required init?(map: Map){
        super.init();
    }
	internal required init(){
    
     super.init();
    }

	func mapping(map: Map)
	{
		competition <- map["competition"]
		link <- map["self"]
		fixtures <- map["fixtures"]
		players <- map["players"]
		players <- map["team"]
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        
         super.init()
         competition = aDecoder.decodeObject(forKey: "competition") as? Competition
         link = aDecoder.decodeObject(forKey: "self") as? Competition
         fixtures = aDecoder.decodeObject(forKey: "fixtures") as? Competition
         players = aDecoder.decodeObject(forKey: "players") as? Competition
 team = aDecoder.decodeObject(forKey: "team") as? Competition
	}
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
       // fatalError("init(realm:schema:) has not been implemented")
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
		if competition != nil{
			aCoder.encode(competition, forKey: "competition")
		}
		if link != nil{
			aCoder.encode(self, forKey: "self")
		}
		if fixtures != nil{
			aCoder.encode(fixtures, forKey: "fixtures")
		}
		if players != nil{
			aCoder.encode(players, forKey: "players")
		}

        if team != nil{
            aCoder.encode(players, forKey: "team")
        }
	}

}
