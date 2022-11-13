//
//  ViewControllerTests.swift
//  SnaphotTestingTests
//
//  Created by Wojciech Spaleniak on 24/10/2022.
//

import XCTest
import SnapshotTesting
@testable import SnaphotTesting

final class ViewControllerTests: XCTestCase {

    var sut: ViewController!
    
    override func setUpWithError() throws {
        sut = ViewController.instantiate()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testDefaultState() {
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testDarkMode() {
        sut.isDarkMood = true
        assertSnapshot(matching: sut, as: .image)
    }
}
