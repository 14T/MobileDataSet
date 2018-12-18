//
//  SPHYearlyTableViewCell.swift
//  DataSetApp
//
//  Created by Chetan Anand on 17/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import UIKit

class SPHYearlyTableViewCell: UITableViewCell {
    
    enum Action: ActionType {
        case indicatorButtonClicked(year: String?)
    }
    
    //MARK: - Properties
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var indicatorButton: UIButton!
    
    //MARK: - ActionDelegate
    weak var delegate: ActionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indicatorButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        
    }
    
    //MARK: - Public
    func setup(viewModel: MobileDataYearlyCellViewModel, delegate : ActionDelegate?) {
        //TODO: - Cell Style

        indicatorButton.isHidden = true
        
        self.delegate = delegate
        self.yearLabel.text = viewModel.year
        self.volumeLabel.text = viewModel.volume
        indicatorButton.isHidden = !viewModel.isDecreaseInVolumeData
        
    }
    
    @objc func buttonClicked(sender : Any?){
        delegate?.onAction(self, Action.indicatorButtonClicked(year: self.yearLabel.text))
    }
    
}
