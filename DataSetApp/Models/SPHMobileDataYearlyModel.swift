//
//  MobileDataYearlyViewModel.swift
//  DataSetApp
//
//  Created by Chetan Anand on 17/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import Foundation


class SPHMobileDataYearlyModel {
    // MARK: - Properties
    var year : String?
    var volumeOfData : Double = 0.0 //petabytes
    var quarterlyItems = [SPHResponseModelRecords]() //petabytes
    var isDecreaseInVolumeData = false
}
