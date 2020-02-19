//
//  ItemListDataProvider.swift
//  TasksApp
//
//  Created by Matheus Oliveira Costa on 18/01/20.
//  Copyright © 2020 mathocosta. All rights reserved.
//

import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource {
    enum Section: Int {
        case tasks
        case completedTasks
    }

    var itemManager: ItemManager?

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemManager = itemManager else { return 0 }
        guard let itemSection = Section(rawValue: section) else { fatalError() }

        switch itemSection {
        case .tasks:
            return itemManager.taskCount
        case .completedTasks:
            return itemManager.completedTaskCount
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ItemTableViewCell", for: indexPath
        ) as? ItemTableViewCell else {
            fatalError()
        }

        if let itemManager = itemManager, let itemSection = Section(rawValue: indexPath.section) {
            switch itemSection {
            case .tasks:
                cell.config(with: itemManager.item(at: indexPath.row))
            case .completedTasks:
                cell.config(with: itemManager.completedItem(at: indexPath.row))
            }
        }

        return cell
    }
}
