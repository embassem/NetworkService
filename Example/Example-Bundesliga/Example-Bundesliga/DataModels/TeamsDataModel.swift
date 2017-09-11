//
//	TeamsDataModel.swift
//
//	Create by Bassem on 29/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import Realm
import RealmSwift
import ObjectMapper_Realm


class TeamsDataModel : Object, NSCoding, Mappable{

	dynamic var links : Link?
	dynamic var count = 0
	 var teams = List<Team>()
    dynamic var competitionId:Int = 0
//TODO:Check realm Doc for Optional 
    
    override class func primaryKey() -> String? { return  "competitionId" }
    
	class func newInstance(map: Map) -> Mappable?{
		return TeamsDataModel()
	}
	required init?(map: Map){
    super.init()
    }
	internal required init(){
    super.init()
    }

    init(CompetitionId:Int,Teams:List<Team>,Count:Int) {
        super.init()
        self.competitionId = CompetitionId;
        self.teams = Teams;
        self.count = Count;
    }
	func mapping(map: Map)
	{
		links <- map["_links"]
		count <- map["count"]
        teams <- (map["teams"], ListTransform<Team>())
    }
		
	

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        super.init()
         links = aDecoder.decodeObject(forKey: "_links") as? Link
         count = (aDecoder.decodeObject(forKey: "count") as? Int)!
         teams = (aDecoder.decodeObject(forKey: "teams") as? List<Team>)! ?? List<Team>()

	}
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
        //fatalError("init(realm:schema:) has not been implemented")
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
		if count != nil{
			aCoder.encode(count, forKey: "count")
		}
		if teams != nil{
			aCoder.encode(teams, forKey: "teams")
		}

	}

}
