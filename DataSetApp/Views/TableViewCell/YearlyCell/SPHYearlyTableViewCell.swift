//
//  SPHYearlyTableViewCell.swift
//  DataSetApp
//
//  Created by Chetan Anand on 17/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import UIKit

class SPHYearlyTableViewCell: UITableViewCell {
    
    //MARK: - Property
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    //MARK: - Public
    func setup(viewModel: MobileDataYearlyCellViewModel) {
        self.yearLabel.text = viewModel.year
        self.volumeLabel.text = viewModel.volume
    }
    
}
