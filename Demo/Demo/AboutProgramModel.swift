//
//	AboutProgramModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class AboutProgram: NSObject, NSCoding, Mappable{
    
    var content: String?
    var photoUrls : [String]?
    var title : String?

    class func newInstance(map: Map) -> Mappable?{
        return AboutProgram()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        content <- map["content"]
        photoUrls <- map["photoUrls"]
        title <- map["title"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        content = aDecoder.decodeObject(forKey: "content") as? String
        photoUrls = aDecoder.decodeObject(forKey: "photoUrls") as? [String]
        title = aDecoder.decodeObject(forKey: "title") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if content != nil{
            aCoder.encode(content, forKey: "content")
        }
        if photoUrls != nil{
            aCoder.encode(photoUrls, forKey: "photoUrls")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        
    }
    
}
