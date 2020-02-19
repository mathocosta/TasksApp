//
//  ItemListDataProviderTests.swift
//  TasksAppTests
//
//  Created by Matheus Oliveira Costa on 18/01/20.
//  Copyright © 2020 mathocosta. All rights reserved.
//

import XCTest
@testable import TasksApp

class ItemListDataProviderTests: XCTestCase {
    var sut: ItemListDataProvider!
    var tableView: UITableView!
    var controller: ItemListViewController!

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as? ItemListViewController
        _ = controller.view

        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        tableView = controller.tableView
        tableView.dataSource = sut
    }

    func testNumberOfSections_IsTwo() {
        let actualNumberOfSections = tableView.numberOfSections
        XCTAssertEqual(actualNumberOfSections, 2)
    }

    func testNumberOfRowsInFirstSection_IsTasksCount() {
        sut.itemManager = ItemManager()

        sut.itemManager?.add(item: TaskItem(title: "First"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)

        sut.itemManager?.add(item: TaskItem(title: "Second"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }

    func testNumberOfRowsInSecondSection_IsCompletedTasksCount() {
        sut.itemManager = ItemManager()

        sut.itemManager?.add(item: TaskItem(title: "First"))
        sut.itemManager?.add(item: TaskItem(title: "Second"))
        sut.itemManager?.checkItem(at: 0)

        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)

        sut.itemManager?.checkItem(at: 0)
        tableView.reloadData()

        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }

    func testCellForRow_ReturnsItemCell() {
        sut.itemManager?.add(item: TaskItem(title: "Test item"))
        tableView.reloadData()
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemTableViewCell")

        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ItemTableViewCell)
    }

    func testCellForRow_DequeuesCell() {
        let mockTableView = MockTableView.mockTableView(with: sut)

        sut.itemManager?.add(item: TaskItem(title: "Test item"))
        mockTableView.reloadData()

        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(mockTableView.cellGotDequeued)
    }

    func testCellForRow_CallsConfigWithTaskItem() {
        let mockTableView = MockTableView.mockTableView(with: sut)

        let item = TaskItem(title: "Test item")
        sut.itemManager?.add(item: item)
        mockTableView.reloadData()

        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockItemTambleViewCellCell

        XCTAssertEqual(item, cell.item)
    }

    func testCellInSectionTwo_GetsConfiguredWithDoneItem() {
        let mockTableView = MockTableView.mockTableView(with: sut)

        let firstItem = TaskItem(title: "First")
        let secondItem = TaskItem(title: "Second")

        sut.itemManager?.add(item: firstItem)
        sut.itemManager?.add(item: secondItem)

        sut.itemManager?.checkItem(at: 1)
        mockTableView.reloadData()

        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! MockItemTambleViewCellCell

        XCTAssertEqual(cell.item, secondItem)
    }
}

// MARK: - Helpers
extension ItemListDataProviderTests {
    class MockTableView: UITableView {
        var cellGotDequeued = false

        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true

            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }

        static func mockTableView(with dataSource: UITableViewDataSource) -> MockTableView {
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))

            mockTableView.dataSource = dataSource
            mockTableView.register(MockItemTambleViewCellCell.self, forCellReuseIdentifier: "ItemTableViewCell")

            return mockTableView
        }
    }

    class MockItemTambleViewCellCell: ItemTableViewCell {
        var item: TaskItem?

        override func config(with item: TaskItem) {
            self.item = item
        }
    }
}
