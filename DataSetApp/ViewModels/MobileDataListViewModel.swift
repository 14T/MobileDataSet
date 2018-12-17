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
    
    // MARK: - Observable Properties
    let title = Observable<String>(value: "")
    let isLoading = Observable<Bool>(value: false)
    var tableItems = Observable<[CellRepresentable]>(value: [])
    
    // MARK: - Private Properties
    private var yearlyItems = [MobileDataYearlyModel]()
    
    // MARK: - TableView Properties
    let tableItemTypes: [CellRepresentable.Type] = [MobileDataCellViewModel.self, MobileDataYearlyCellViewModel.self]

    
}

extension MobileDataListViewModel {
    func start() {
        self.isLoading.value = true
        self.title.value = "Loading..."
        dataService.fetchDataFromServer { [weak self] (records) in
            self?.isLoading.value = false
            self?.tableItems.value.removeAll()
            if let records = records.result?.records{
                for item in records {
                    self?.addYearItemIfNotPresent(value: item)
                }
            }
            
            self?.showYearlyItems()
            self?.title.value = "Mobile Data Usage"

        }
    }
    
    func addYearItemIfNotPresent(value : SPHResponseModelRecords){
        
        if let quarterString =  value.quarter {
            if let yearStringValue = quarterString.components(separatedBy: "-").first {
                for item in yearlyItems {
                    if item.year == yearStringValue {
                        item.quarterlyItems.append(value)
                        item.volumeOfData = self.totalDataUsedInAnYear(yearlyItem: item)
//                        debugPrint("YEAR: \(item.year) , TOTAL: \(item.volumeOfData) COUNT: \(item.quarterlyItems.count)")
                        return
                    }
                }
                    let yearlyItem = MobileDataYearlyModel()
                    yearlyItem.year = yearStringValue
                    yearlyItem.quarterlyItems.append(value)
                    yearlyItems.append(yearlyItem)
                
            }
        }
    }
    func totalDataUsedInAnYear(yearlyItem : MobileDataYearlyModel) -> Double {
        var dataUsed : Double = 0.0
        for item in yearlyItem.quarterlyItems {
            dataUsed += Double(item.volumeOfMobileData ?? "0.0") ?? 0.0
        }
        return dataUsed
    }
    
    func showYearlyItems(){
        var mobileDataYearlyCellViewModels = [MobileDataYearlyCellViewModel]()
        for item in yearlyItems {
            mobileDataYearlyCellViewModels.append(MobileDataYearlyCellViewModel(value: item))
        }
        self.tableItems.value = mobileDataYearlyCellViewModels
    }
    
}

