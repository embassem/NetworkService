//
//	Player.swift
//
//	Create by Bassem on 5/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Player : NSObject, NSCoding, Mappable{

	var contractUntil : String?
	var dateOfBirth : String?
	var jerseyNumber : Int?
	var marketValue : String?
	var name : String?
	var nationality : String?
	var position : String?


	class func newInstance(map: Map) -> Mappable?{
		return Player()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		contractUntil <- map["contractUntil"]
		dateOfBirth <- map["dateOfBirth"]
		jerseyNumber <- map["jerseyNumber"]
		marketValue <- map["marketValue"]
		name <- map["name"]
		nationality <- map["nationality"]
		position <- map["position"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         contractUntil = aDecoder.decodeObject(forKey: "contractUntil") as? String
         dateOfBirth = aDecoder.decodeObject(forKey: "dateOfBirth") as? String
         jerseyNumber = aDecoder.decodeObject(forKey: "jerseyNumber") as? Int
         marketValue = aDecoder.decodeObject(forKey: "marketValue") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         nationality = aDecoder.decodeObject(forKey: "nationality") as? String
         position = aDecoder.decodeObject(forKey: "position") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if contractUntil != nil{
			aCoder.encode(contractUntil, forKey: "contractUntil")
		}
		if dateOfBirth != nil{
			aCoder.encode(dateOfBirth, forKey: "dateOfBirth")
		}
		if jerseyNumber != nil{
			aCoder.encode(jerseyNumber, forKey: "jerseyNumber")
		}
		if marketValue != nil{
			aCoder.encode(marketValue, forKey: "marketValue")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if nationality != nil{
			aCoder.encode(nationality, forKey: "nationality")
		}
		if position != nil{
			aCoder.encode(position, forKey: "position")
		}

	}

}