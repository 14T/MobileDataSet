//
//  MobileDataViewModel.swift
//  DataSetApp
//
//  Created by Chetan Anand on 16/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import Foundation


class MobileDataListViewModel {
    // MARK: - service
    private  var dataService = DataServices()
    
    // MARK: - Properties
    let volume = Observable<String>(value: "0.000384")
    let quarter = Observable<String>(value: "2004-Q3")
    let id = Observable<Int>(value: 1)
    let isLoading = Observable<Bool>(value: false)
    let tableItems = Observable<[CellRepresentable]>(value: [])
    
}

// MARK: - UIValues
extension MobileDataListViewModel {
    public var title: String? {
        return "name"
    }
    
    public var subtitle: String? {
        return "ratingDescription"
    }
    
}


extension MobileDataListViewModel {
    func start() {
        self.isLoading.value = true
        dataService.fetchDateFromServer { [weak self] (records) in
            self?.isLoading.value = false
            self?.tableItems.value.removeAll()
            
            if let tableRecords = records.result?.records {
                for item in tableRecords {
                    let cellModel = MobileDataCellViewModel(value: item)
                    self?.tableItems.value.append(cellModel)
                }
            }
        }
    }
}

