//
//  SPHResponseModelRecords.swift
//
//  Created by Chetan Anand on 16/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class SPHResponseModelRecords: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kSPHResponseModelRecordsInternalIdentifierKey: String = "_id"
	internal let kSPHResponseModelRecordsVolumeOfMobileDataKey: String = "volume_of_mobile_data"
	internal let kSPHResponseModelRecordsQuarterKey: String = "quarter"


    // MARK: Properties
	public var internalIdentifier: Int?
	public var volumeOfMobileData: String?
	public var quarter: String?


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
		internalIdentifier = json[kSPHResponseModelRecordsInternalIdentifierKey].int
		volumeOfMobileData = json[kSPHResponseModelRecordsVolumeOfMobileDataKey].string
		quarter = json[kSPHResponseModelRecordsQuarterKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if internalIdentifier != nil {
//            dictionary.updateValue(internalIdentifier!, forKey: kSPHResponseModelRecordsInternalIdentifierKey)
//        }
//        if volumeOfMobileData != nil {
//            dictionary.updateValue(volumeOfMobileData!, forKey: kSPHResponseModelRecordsVolumeOfMobileDataKey)
//        }
//        if quarter != nil {
//            dictionary.updateValue(quarter!, forKey: kSPHResponseModelRecordsQuarterKey)
//        }
//
//        return dictionary
//    }

}
