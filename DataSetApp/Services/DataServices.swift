//
//  DataServices.swift
//  DataSetApp
//
//  Created by Chetan Anand on 16/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/// This service provides interfaces for communication between client and server
class DataServices {
    let urlString = "https://data.gov.sg/api/action/datastore_search"
    let parameters: Parameters = ["resource_id": "a807b7ab-6cad-4aa6-87d0-e283a7353a0f",
                                  "limit": 20]
    /// Fetch feeds from server
    func fetchDataFromServer(complete: @escaping (SPHResponseModelBase) -> Void) {
        Alamofire.request(urlString,  method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                debugPrint("JSON: \(json)")
                let baseModel = SPHResponseModelBase(json: json)
                complete(baseModel)
            case .failure(let error):
                print(error)
            }
        }
    }
}
