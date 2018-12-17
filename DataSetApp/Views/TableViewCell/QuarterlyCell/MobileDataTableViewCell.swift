//
//  MobileDataTableViewCell.swift
//  DataSetApp
//
//  Created by Chetan Anand on 16/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import UIKit

class MobileDataTableViewCell: UITableViewCell {

    @IBOutlet weak var volumeLabel: UILabel!

    //MARK: - Public
    func setup(viewModel: MobileDataCellViewModel) {
        self.volumeLabel.text = viewModel.volume
    }
    
}
