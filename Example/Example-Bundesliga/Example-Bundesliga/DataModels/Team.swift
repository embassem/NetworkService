//
//	Team.swift
//
//	Create by Bassem on 29/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import RealmSwift
import Realm

class Team :  Object, NSCoding, Mappable{
    public required init?(coder aDecoder: NSCoder) {
        super.init()
    }


	dynamic var links : Link?
	dynamic var code : String?
	dynamic var crestUrl : String?
	dynamic var name : String?
	dynamic var shortName : String?
	dynamic var squadMarketValue : String?
    dynamic var teamID : String?
    let datamodel = LinkingObjects(fromType: TeamsDataModel.self, property: "teams")

  //override class func primaryKey() -> String? { return "code" }
	class func newInstance(map: Map) -> Mappable?{
		return Team()
	}
	required convenience init?(map: Map){
    self.init()
    
    }
	internal required init(){
    
    super.init()
    
    }
    
    func setTeamId(){
        if let href =  self.links?.link?.href{
            self.teamID =  href.splitted(by: "/").last
        }
        
    }

	func mapping(map: Map)
	{
		links <- map["_links"]
		code <- map["code"]
		crestUrl <- map["crestUrl"]
		name <- map["name"]
		shortName <- map["shortName"]
		squadMarketValue <- map["squadMarketValue"]
        
		self.setTeamId()
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    
   /* @objc required init(coder aDecoder: NSCoder)
	{
        
         links = aDecoder.decodeObject(forKey: "_links") as? Link
         code = aDecoder.decodeObject(forKey: "code") as? String
         crestUrl = aDecoder.decodeObject(forKey: "crestUrl") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         shortName = aDecoder.decodeObject(forKey: "shortName") as? AnyObject
         squadMarketValue = aDecoder.decodeObject(forKey: "squadMarketValue") as? AnyObject

	}*/
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
       // fatalError("init(realm:schema:) has not been implemented")
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if links != nil{
			aCoder.encode(links, forKey: "_links")
		}
		if code != nil{
			aCoder.encode(code, forKey: "code")
		}
		if crestUrl != nil{
			aCoder.encode(crestUrl, forKey: "crestUrl")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if shortName != nil{
			aCoder.encode(shortName, forKey: "shortName")
		}
		if squadMarketValue != nil{
			aCoder.encode(squadMarketValue, forKey: "squadMarketValue")
		}

	}

}


