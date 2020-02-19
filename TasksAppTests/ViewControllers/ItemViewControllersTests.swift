//
//  ItemViewControllersTests.swift
//  TasksAppTests
//
//  Created by Matheus Oliveira Costa on 18/01/20.
//  Copyright © 2020 mathocosta. All rights reserved.
//

import XCTest
@testable import TasksApp

class ItemViewControllersTests: XCTestCase {

    var sut: ItemListViewController {
        makeSUT()
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }

    func testViewDidLoad_ShouldSetTableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
    }

    func testViewDidLoad_ShouldSetTableViewDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
    }

    // MARK: - Helpers
    func makeSUT() -> ItemListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(
            withIdentifier: "ItemListViewController") as! ItemListViewController

        _ = sut.view

        return sut
    }
}
