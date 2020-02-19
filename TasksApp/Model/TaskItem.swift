//
//  TaskItem.swift
//  TasksApp
//
//  Created by Matheus Oliveira Costa on 28/12/19.
//  Copyright © 2019 mathocosta. All rights reserved.
//

import Foundation

struct TaskItem: Equatable {
    let title: String
    let description: String?
    let timestamp: Double?
    let location: Location?

    init(title: String, description: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        self.timestamp = timestamp
        self.location = location
    }

    static func == (lhs: TaskItem, rhs: TaskItem) -> Bool {
        if lhs.location != rhs.location {
            return false
        }

        if lhs.timestamp != rhs.timestamp {
            return false
        }

        if lhs.description != rhs.description {
            return false
        }

        if lhs.title != rhs.title {
            return false
        }

        return true
    }
}
