//
//  ItemManager.swift
//  TasksApp
//
//  Created by Matheus Oliveira Costa on 28/12/19.
//  Copyright © 2019 mathocosta. All rights reserved.
//

import Foundation

class ItemManager {
    private var items = [TaskItem]()
    private var completedItems = [TaskItem]()

    var taskCount: Int {
        return items.count
    }

    var completedTaskCount: Int {
        return completedItems.count
    }

    func add(item: TaskItem) {
        if !items.contains(item) {
            items.append(item)
        }
    }

    func item(at index: Int) -> TaskItem {
        return items[index]
    }

    func completedItem(at index: Int) -> TaskItem {
        return completedItems[index]
    }

    func checkItem(at index: Int) {
        let completed = items.remove(at: index)
        completedItems.append(completed)
    }

    func removeAllItems() {
        items.removeAll()
        completedItems.removeAll()
    }
}
