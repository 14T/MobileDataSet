//
//  ViewController.swift
//  DataSetApp
//
//  Created by Chetan Anand on 15/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel =  MobileDataListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initBinding()
        viewModel.start()
    }

    func initView() {
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.tableItemTypes.forEach { $0.registerCell(tableView: tableView) }
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func initBinding() {
        viewModel.tableItems.addObserver(fireNow: false) { [weak self] (sectionViewModels) in
            self?.tableView.reloadData()
        }
        viewModel.title.addObserver { [weak self] (title) in
            self?.title = title
        }

        viewModel.isLoading.addObserver { [weak self] (isLoading) in
            if isLoading {
                // Show loader
            } else {
                // hide loader
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableItems.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableItem = viewModel.tableItems.value[indexPath.row]
//        tableItem.setDelegate(delegate: self)
        let cell = tableItem.cellInstance(tableView: tableView, indexPath: indexPath, delegate: self)
        return cell
    }

}


extension ViewController: ActionDelegate {
    // Some VC properties and methods...
    func onAction(_ sender: Any?, _ action: ActionType) {
        switch action {
        case SPHYearlyTableViewCell.Action.indicatorButtonClicked(let year):
            debugPrint("Cell Button Clicked")
            
            let alert = UIAlertController(title: "Info", message: "This represents a decrease in Quarterly Mobile Data usages in year :\(year ?? "")", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        default:
            debugPrint(action)
        }
    }
}
