//
//  SwiftTestTests.swift
//  SwiftTestTests
//
//  Created by Faruk Yaşar on 7.04.2023.
//

import XCTest
@testable import SwiftTest

final class SwiftTestTests: XCTestCase {

  
    let math = MathFunction()
    
    func testAddIntegerFunc(){
        let result = math.addIntegers(x: 12, y: 23)
        XCTAssertEqual(result, 35)
    }
    
    func testMultiplyIntegerFunc(){
        let result = math.multiplyIntegers(x: 5 , y: 8)
        XCTAssertEqual(result, 40)
    }
    func testdivideIntegerFunc(){
        let result = math.divideIntegers(x: 6, y: 3)
        XCTAssertEqual(result, 2)
    }
   

}
