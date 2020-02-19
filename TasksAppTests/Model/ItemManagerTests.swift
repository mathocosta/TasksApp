//
//  ItemManagerTests.swift
//  TasksAppTests
//
//  Created by Matheus Oliveira Costa on 28/12/19.
//  Copyright © 2019 mathocosta. All rights reserved.
//

import XCTest
@testable import TasksApp

class ItemManagerTests: XCTestCase {

    var sut: ItemManager!

    override func setUp() {
        self.sut = ItemManager()
    }

    func testTaskCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.taskCount, 0, "Initially task count should be 0")
    }

    func testCompletedTaskCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.completedTaskCount, 0, "Initially task count should be 0")
    }

    func testTaskCount_AfterAddingOneItem_IsOne() {
        sut.add(item: TaskItem(title: "Test title"))
        XCTAssertEqual(sut.taskCount, 1, "Task count should be 1 after add one item")
    }

    func testItemAtIndex_ShouldReturnPreviouslyAddedItem() {
        let item = TaskItem(title: "Test title")
        sut.add(item: item)

        XCTAssertEqual(sut.item(at: 0).title, item.title, "Should be the same item")
    }

    func testCheckingItem_ChangesCountOfTaskCountAndOfCompletedTaskCount() {
        sut.add(item: TaskItem(title: "First Item"))
        sut.checkItem(at: 0)

        XCTAssertEqual(sut.taskCount, 0, "taskCount should be 0")
        XCTAssertEqual(sut.completedTaskCount, 1, "completedTaskCount should be 1")
    }

    func testCheckingItem_RemovesItFromTheItemsList() {
        let firstItem = TaskItem(title: "First Item")
        let secondItem = TaskItem(title: "Second Item")
        sut.add(item: firstItem)
        sut.add(item: secondItem)
        sut.checkItem(at: 0)
        
        XCTAssertEqual(sut.item(at: 0).title, secondItem.title)
    }

    func testDoneItemAtIndex_ShouldReturnPreviouslyCheckedItem() {
        let item = TaskItem(title: "Item")
        sut.add(item: item)
        sut.checkItem(at: 0)

        XCTAssertEqual(item.title, sut.completedItem(at: 0).title, "should be the same item")
    }

    func testRemoveAllItems_ShouldResultInCountsZero() {
        sut.add(item: TaskItem(title: "First"))
        sut.add(item: TaskItem(title: "Second"))
        sut.checkItem(at: 0)

        XCTAssertEqual(sut.taskCount, 1, "taskCount should be 1")
        XCTAssertEqual(sut.completedTaskCount, 1, "completedTaskCount should be 1")

        sut.removeAllItems()

        XCTAssertEqual(sut.taskCount, 0, "taskCount should be 1")
        XCTAssertEqual(sut.completedTaskCount, 0, "completedTaskCount should be 1")
    }

    func testAddingTheSameItem_DoesNotIncreaseCount() {
        sut.add(item: TaskItem(title: "First"))
        sut.add(item: TaskItem(title: "First"))

        XCTAssertEqual(sut.taskCount, 1)
    }

}
