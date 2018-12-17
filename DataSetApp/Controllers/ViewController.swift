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
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.tableItemTypes.forEach { $0.registerCell(tableView: tableView) }

        initBinding()
        viewModel.start()
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
        let cell = tableItem.cellInstance(tableView: tableView, indexPath: indexPath)
        return cell
    }

}
