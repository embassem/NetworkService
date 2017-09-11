//
//	PlayersDataModel.swift
//
//	Create by Bassem on 5/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class PlayersDataModel : NSObject, NSCoding, Mappable{

	var links : Link?
	var count : Int?
	var players : [Player]?


	class func newInstance(map: Map) -> Mappable?{
		return PlayersDataModel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		links <- map["_links"]
		count <- map["count"]
		players <- map["players"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         links = aDecoder.decodeObject(forKey: "_links") as? Link
         count = aDecoder.decodeObject(forKey: "count") as? Int
         players = aDecoder.decodeObject(forKey: "players") as? [Player]

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
		if players != nil{
			aCoder.encode(players, forKey: "players")
		}

	}

}