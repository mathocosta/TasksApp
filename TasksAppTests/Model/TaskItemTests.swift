//
//  TaskItemTests.swift
//  TasksAppTests
//
//  Created by Matheus Oliveira Costa on 28/12/19.
//  Copyright © 2019 mathocosta. All rights reserved.
//

import XCTest
@testable import TasksApp

class TaskItemTests: XCTestCase {

    func testInit_ShouldTakeTitle() {
        let item = TaskItem(title: "Test title")
        XCTAssertEqual(item.title, "Test title", "Initializer should set the item title")
    }

    func testInit_ShouldTakeTitleAndDescription() {
        let item = TaskItem(title: "Test title", description: "Test description")
        XCTAssertEqual(item.description, "Test description", "Initializer should set the item title")
    }

    func testInit_ShouldSetTitleAndDescriptionAndTimestamp() {
        let item = TaskItem(title: "Test title", description: "Test description", timestamp: 0.0)
        XCTAssertEqual(0.0, item.timestamp, "Initializer should set the timestamp")
    }

    func testInit_ShouldSetTitleAndDescriptionAndTimestampAndLocation() {
        let location = Location(name: "Test name")
        let item = TaskItem(title: "Test title", description: "Test description", timestamp: 0.0, location: location)

        XCTAssertEqual(location.name, item.location?.name, "Initializer should set the location") 
    }

    func testEqualItems_ShouldBeEqual() {
        let firstItem = TaskItem(title: "Test item")
        let secondItem = TaskItem(title: "Test item")

        XCTAssertEqual(firstItem, secondItem)
    }

    func testWhenLocationDifferes_ShouldBeNotEqual() {
        let firstItem = TaskItem(title: "Test item", description: "Test description", timestamp: 0.0, location: Location(name: "House"))
        let secondItem = TaskItem(title: "Test item", description: "Test description", timestamp: 0.0, location: Location(name: "Work"))

        XCTAssertNotEqual(firstItem, secondItem)
    }

    func testWhenOneLocationIsNilAndTheOtherIsnt_ShouldBeNotEqual() {
        let firstItem = TaskItem(title: "Test item", description: "Test description", timestamp: 0.0, location: Location(name: "House"))
        let secondItem = TaskItem(title: "Test item", description: "Test description", timestamp: 0.0, location: nil)

        XCTAssertNotEqual(firstItem, secondItem)
    }

    func testWhenTimestampDifferes_ShouldBeNotEqual() {
        let firstItem = TaskItem(title: "Test item", description: "First description", timestamp: 1.0)
        let secondItem = TaskItem(title: "Test item", description: "First description", timestamp: 0.0)

        XCTAssertNotEqual(firstItem, secondItem)
    }

    func testWhenDescriptionDifferes_ShouldBeNotEqual() {
        let firstItem = TaskItem(title: "Test item", description: "First description")
        let secondItem = TaskItem(title: "Test item", description: "Second description")

        XCTAssertNotEqual(firstItem, secondItem)
    }

    func testWhenTitleDifferes_ShouldBeNotEqual() {
        let firstItem = TaskItem(title: "First item")
        let secondItem = TaskItem(title: "Second item")

        XCTAssertNotEqual(firstItem, secondItem)
    }
}
