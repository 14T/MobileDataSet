//
//  SPHResponseModelBase.swift
//
//  Created by Chetan Anand on 16/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class SPHResponseModelBase: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kSPHResponseModelBaseSuccessKey: String = "success"
	internal let kSPHResponseModelBaseResultKey: String = "result"
	internal let kSPHResponseModelBaseHelpKey: String = "help"


    // MARK: Properties
	public var success: Bool = false
	public var result: SPHResponseModelResult?
	public var help: String?


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
		success = json[kSPHResponseModelBaseSuccessKey].boolValue
		result = SPHResponseModelResult(json: json[kSPHResponseModelBaseResultKey])
		help = json[kSPHResponseModelBaseHelpKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        dictionary.updateValue(success, forKey: kSPHResponseModelBaseSuccessKey)
//        if result != nil {
//            dictionary.updateValue(result!.dictionaryRepresentation(), forKey: kSPHResponseModelBaseResultKey)
//        }
//        if help != nil {
//            dictionary.updateValue(help!, forKey: kSPHResponseModelBaseHelpKey)
//        }
//
//        return dictionary
//    }

}
