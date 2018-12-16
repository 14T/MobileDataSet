//
//  SPHResponseModelResult.swift
//
//  Created by Chetan Anand on 16/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class SPHResponseModelResult: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kSPHResponseModelResultLimitKey: String = "limit"
	internal let kSPHResponseModelResultTotalKey: String = "total"
	internal let kSPHResponseModelResultFieldsKey: String = "fields"
	internal let kSPHResponseModelResultLinksKey: String = "_links"
	internal let kSPHResponseModelResultRecordsKey: String = "records"
	internal let kSPHResponseModelResultResourceIdKey: String = "resource_id"


    // MARK: Properties
	public var limit: Int?
	public var total: Int?
	public var fields: [SPHResponseModelFields]?
	public var links: SPHResponseModelLinks?
	public var records: [SPHResponseModelRecords]?
	public var resourceId: String?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		limit = json[kSPHResponseModelResultLimitKey].int
		total = json[kSPHResponseModelResultTotalKey].int
		fields = []
		if let items = json[kSPHResponseModelResultFieldsKey].array {
			for item in items {
				fields?.append(SPHResponseModelFields(json: item))
			}
		} else {
			fields = nil
		}
		links = SPHResponseModelLinks(json: json[kSPHResponseModelResultLinksKey])
		records = []
		if let items = json[kSPHResponseModelResultRecordsKey].array {
			for item in items {
				records?.append(SPHResponseModelRecords(json: item))
			}
		} else {
			records = nil
		}
		resourceId = json[kSPHResponseModelResultResourceIdKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if limit != nil {
//            dictionary.updateValue(limit!, forKey: kSPHResponseModelResultLimitKey)
//        }
//        if total != nil {
//            dictionary.updateValue(total!, forKey: kSPHResponseModelResultTotalKey)
//        }
//        if fields?.count > 0 {
//            var temp: [AnyObject] = []
//            for item in fields! {
//                temp.append(item.dictionaryRepresentation())
//            }
//            dictionary.updateValue(temp, forKey: kSPHResponseModelResultFieldsKey)
//        }
//        if links != nil {
//            dictionary.updateValue(links!.dictionaryRepresentation(), forKey: kSPHResponseModelResultLinksKey)
//        }
//        if records?.count > 0 {
//            var temp: [AnyObject] = []
//            for item in records! {
//                temp.append(item.dictionaryRepresentation())
//            }
//            dictionary.updateValue(temp, forKey: kSPHResponseModelResultRecordsKey)
//        }
//        if resourceId != nil {
//            dictionary.updateValue(resourceId!, forKey: kSPHResponseModelResultResourceIdKey)
//        }
//
//        return dictionary
//    }

}
