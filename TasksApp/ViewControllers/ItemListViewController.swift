//
//  ItemListViewController.swift
//  TasksApp
//
//  Created by Matheus Oliveira Costa on 18/01/20.
//  Copyright © 2020 mathocosta. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }

}
