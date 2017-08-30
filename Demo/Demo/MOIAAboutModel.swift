//
//	MOIAAboutModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class MOIAAboutModel : NSObject, NSCoding, Mappable{

	var descriptionField : String?
	var photos : [String]?
	var title : String?


	class func newInstance(map: Map) -> Mappable?{
		return MOIAAboutModel()
	}
	required init?(map: Map){}
	 override init(){}

	func mapping(map: Map)
	{
		descriptionField <- map["description"]
		photos <- map["photos"]
		title <- map["title"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         photos = aDecoder.decodeObject(forKey: "photos") as? [String]
         title = aDecoder.decodeObject(forKey: "title") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if photos != nil{
			aCoder.encode(photos, forKey: "photos")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}

	}

}
