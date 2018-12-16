//
//  CellRepresentable.swift
//  DataSetApp
//
//  Created by Chetan Anand on 16/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import Foundation
import UIKit

protocol CellRepresentable {
    static func registerCell(tableView: UITableView)
    func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func cellSelected()
}
