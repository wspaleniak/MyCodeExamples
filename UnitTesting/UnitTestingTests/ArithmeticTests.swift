//
//  ArithmeticTests.swift
//  UnitTestingTests
//
//  Created by Wojciech Spaleniak on 21/10/2022.
//

import XCTest
@testable import UnitTesting

final class ArithmeticTests: XCTestCase {

    var sut: Arithmetic!
    
    // THIS METHOD IS CALLED BEFORE THE INVOCATION OF EACH TEST METHOD IN THE CLASS
    override func setUpWithError() throws {
        
        sut = Arithmetic()
    }

    // THIS METHOD IS CALLED AFTER THE INVOCATION OF EACH TEST METHOD IN THE CLASS
    override func tearDownWithError() throws {
        
        sut = nil
    }
    
    func testAdditionOfPositiveNumbers() {
        //GIVEN
        let num1 = 2
        let num2 = 5
        //WHEN
        let result = sut.add(num1: num1, num2: num2)
        //THEN
        XCTAssertEqual(result, 7)
    }
    
    func testAdditionNegativeNumbers() {
        //GIVEN
        let num1 = -2
        let num2 = -5
        //WHEN
        let result = sut.add(num1: num1, num2: num2)
        //THEN
        XCTAssertEqual(result, -7)
    }
    
    func testWrongAddition() {
        //GIVEN
        let num1 = 2
        let num2 = 0
        //WHEN
        let result = sut.add(num1: num1, num2: num2)
        //THEN
        XCTAssertNotEqual(result, 20)
    }
    
    func testMultiplicationOfSimilarNumbers() {
        //GIVEN
        let num1 = 2
        let num2 = 2
        //WHEN
        let result = sut.mul(num1: num1, num2: num2)
        //THEN
        XCTAssertEqual(result, 4)
    }
    
    func testMultiplicationOfDifferentNumbers() {
        //GIVEN
        let num1 = 2
        let num2 = 5
        //WHEN
        let result = sut.mul(num1: num1, num2: num2)
        //THEN
        XCTAssertEqual(result, 10)
    }
}
