//
//  Star_Wars_VehiclesTests.swift
//  Star Wars VehiclesTests
//
//  Created by Bimonaretga on 5/28/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import XCTest
@testable import Star_Wars_Vehicles

class Star_Wars_VehiclesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testAPIRequests() {
        let vc = ViewController()
        vc.requestVehicle(stringUrl: "s://swapi.co/api/vehicles/4") { (vehicle) in
            XCTAssertEqual(vehicle.name, "Sand Crawler")
        }
    }

    
    func testVehicleStructInitWithJSON() {
        let json: JSON = ["name":"Crawler"]
        let crawler = Vehicle(json: json)
        XCTAssertEqual(crawler?.name, "Crawler")
    }
    
    func testVehicleFailableInit() {
        let json = JSON()
        let dummy = Vehicle(json: json)
        XCTAssertEqual(dummy?.name, nil)
    }
    
    
}
