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
    public var volume: String?
    //MARK: - Events
    //    var didSelectString: ((String) -> Void)?
    
    init(value: SPHResponseModelRecords) {
        self.volume = value.volumeOfMobileData
    }
}

//MARK: - CellRepresentable
extension MobileDataCellViewModel: CellRepresentable {
    func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MobileDataTableViewCell", for: indexPath) as! MobileDataTableViewCell
        cell.setup(viewModel: self)
        return cell
    }
    
    static func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: "MobileDataTableViewCell", bundle: nil), forCellReuseIdentifier: "MobileDataTableViewCell")
    }

    func cellSelected() {
//        self.didSelectString?("\(self.rawValue)")
    }
}
