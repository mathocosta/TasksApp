//
//  LocationTests.swift
//  TasksAppTests
//
//  Created by Matheus Oliveira Costa on 28/12/19.
//  Copyright © 2019 mathocosta. All rights reserved.
//

import XCTest
import CoreLocation
@testable import TasksApp

class LocationTests: XCTestCase {

    func testInit_ShouldSetName() {
        let location = Location(name: "Test name")

        XCTAssertEqual(location.name, "Test name", "Initializer should set the name")
    }

    func testInit_ShouldSetNameAndCoordinate() {
        let testCoordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: testCoordinate)

        XCTAssertEqual(location.coordinate?.latitude, testCoordinate.latitude, "Initializer should set latitude")
        XCTAssertEqual(location.coordinate?.longitude, testCoordinate.longitude, "Initializer should set longitude")
    }

    func testEqualLocations_ShouldBeEqual() {
        let firstLocation = Location(name: "Home")
        let secondLocation = Location(name: "Home")

        XCTAssertEqual(firstLocation, secondLocation)
    }

    func testWhenNameDiffers_ShouldBeNotEqual() {
        let firstLocation = Location(name: "Home")
        let secondLocation = Location(name: "Work")

        XCTAssertNotEqual(firstLocation, secondLocation)
    }

    func testWhenLatitudeDiffers_ShouldBeNotEqual() {
        let firstLocation = Location(name: "Home", coordinate: CLLocationCoordinate2D(latitude: 1.0, longitude: 0.0))
        let secondLocation = Location(name: "Home", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))

        XCTAssertNotEqual(firstLocation, secondLocation)
    }

    func testWhenLongitudeDiffers_ShouldBeNotEqual() {
        let firstLocation = Location(name: "Home", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 1.0))
        let secondLocation = Location(name: "Home", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))

        XCTAssertNotEqual(firstLocation, secondLocation)
    }

    func testWhenOneHasCoordinateAndTheOtherDoesnt_ShouldBeNotEqual() {
        let firstLocation = Location(name: "Home", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 1.0))
        let secondLocation = Location(name: "Home")

        XCTAssertNotEqual(firstLocation, secondLocation)
    }
}
