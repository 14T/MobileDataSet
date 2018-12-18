//
//  MobileDataCellViewModel.swift
//  DataSetApp
//
//  Created by Chetan Anand on 16/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import Foundation
import UIKit

class MobileDataCellViewModel {

    //MARK: - Properties
    private var reesponseModelRecords: SPHResponseModelRecords?
   
    //MARK: - Init
    init(value: SPHResponseModelRecords) {
        self.reesponseModelRecords = value
    }

}

//MARK: - UI Representable Data
extension MobileDataCellViewModel {
    public var volume: String? {
        return reesponseModelRecords?.volumeOfMobileData
    }
}


//MARK: - CellRepresentable
extension MobileDataCellViewModel: CellRepresentable {
    func cellInstance(tableView: UITableView, indexPath: IndexPath, delegate: ActionDelegate?) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MobileDataTableViewCell.self), for: indexPath) as! MobileDataTableViewCell
        cell.setup(viewModel: self, delegate: delegate)
        return cell
    }

    static func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: String(describing: MobileDataTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MobileDataTableViewCell.self))
    }

    func cellSelected() {

    }
}
