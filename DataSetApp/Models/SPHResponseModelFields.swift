//
//  SPHResponseModelFields.swift
//
//  Created by Chetan Anand on 16/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class SPHResponseModelFields: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kSPHResponseModelFieldsInternalIdentifierKey: String = "id"
	internal let kSPHResponseModelFieldsTypeKey: String = "type"


    // MARK: Properties
	public var internalIdentifier: String?
	public var type: String?


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
		internalIdentifier = json[kSPHResponseModelFieldsInternalIdentifierKey].string
		type = json[kSPHResponseModelFieldsTypeKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if internalIdentifier != nil {
//            dictionary.updateValue(internalIdentifier!, forKey: kSPHResponseModelFieldsInternalIdentifierKey)
//        }
//        if type != nil {
//            dictionary.updateValue(type!, forKey: kSPHResponseModelFieldsTypeKey)
//        }
//
//        return dictionary
//    }

}
