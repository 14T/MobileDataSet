//
//  MobileDataYearlyCellViewModel.swift
//  DataSetApp
//
//  Created by Chetan Anand on 17/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import Foundation
import UIKit

class MobileDataYearlyCellViewModel {
    
     //MARK: - Properties
    private var reesponseModelRecords: SPHMobileDataYearlyModel?
    
    //MARK: - Init
    init(value: SPHMobileDataYearlyModel) {
        self.reesponseModelRecords = value
    }
}

//MARK: - UI Representable Data
extension MobileDataYearlyCellViewModel {
    public var year: String? {
        return reesponseModelRecords?.year 
    }
    public var volume: String? {
        return String(reesponseModelRecords?.volumeOfData ?? 0.0)
    }
    
    public var isDecreaseInVolumeData: Bool {
        return reesponseModelRecords?.isDecreaseInVolumeData ?? false
    }
}


//MARK: - CellRepresentable
extension MobileDataYearlyCellViewModel: CellRepresentable {

    func cellInstance(tableView: UITableView, indexPath: IndexPath, delegate : ActionDelegate? = nil) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SPHYearlyTableViewCell.self), for: indexPath) as! SPHYearlyTableViewCell
        cell.setup(viewModel: self, delegate: delegate)
        return cell
    }
    
    static func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: String(describing: SPHYearlyTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SPHYearlyTableViewCell.self))
    }
    
    func cellSelected() {
    }
}
