//
//  UITestingUITests.swift
//  UITestingUITests
//
//  Created by Wojciech Spaleniak on 22/10/2022.
//

import XCTest

final class UITestingUITests: XCTestCase {

    func testAddNoiseMaker() {
        let app = XCUIApplication()
        app.launch()
        
        let newNameBtn = app.navigationBars["Noise Makers"].buttons["add"]
        let nameField = app.alerts["Add noise maker"].scrollViews.otherElements.collectionViews.textFields["Name"]
        let addBtn = app.alerts["Add noise maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell = app.tables.staticTexts["Wojtek"]
        
        newNameBtn.tap()
        nameField.tap()
        nameField.typeText("Wojtek")
        XCTAssertFalse(addedCell.exists)
        addBtn.tap()
        XCTAssertTrue(addedCell.exists)
    }
    
    func testDeleteNoiseMaker() {
        let app = XCUIApplication()
        app.launch()
        
        let newNameBtn = app.navigationBars["Noise Makers"].buttons["add"]
        let nameField = app.alerts["Add noise maker"].scrollViews.otherElements.collectionViews.textFields["Name"]
        let addBtn = app.alerts["Add noise maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell = app.tables.staticTexts["Wojtek"]
        let tablesQuery = app.tables
        let deleteBtn = tablesQuery.buttons["Delete"]
        
        newNameBtn.tap()
        nameField.tap()
        nameField.typeText("Wojtek")
        addBtn.tap()
        
        addedCell.swipeLeft()
        deleteBtn.tap()
        app.tables["Empty list"].tap()
        
        XCTAssertFalse(addedCell.exists)
    }
}
