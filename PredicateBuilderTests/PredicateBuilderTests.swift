//
//  PredicateBuilderTests.swift
//  PredicateBuilderTests
//
//  Created by Muronaka Hiroaki on 2017/06/11.
//  Copyright © 2017年 Muronaka Hiroaki. All rights reserved.
//

//
//  PredicateBuilderTest.swift
//  PredicateDSL
//
//  Created by Muronaka Hiroaki on 2017/06/11.
//  Copyright © 2017年 Muronaka Hiroaki. All rights reserved.
//

import XCTest
@testable import PredicateBuilder

class PredicateBuilderTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEqStr() {
        let val = "abc"
        let predicate = NSPredicate(format: "key == %@", val)
        XCTAssertEqual(predicate, "key".pred.eq(val))
        
    }
    
    func testEqInt() {
        let val = 123
        let predicate = NSPredicate(format: "key == %d", val)
        XCTAssertEqual(predicate, "key".pred.eq(123))
    }
    
    func testEqInt2() {
        let val = 123
        let predicate = NSPredicate(format: "key == %d", val)
        XCTAssertEqual(predicate, "key".pred == 123)
    }
     
    func testLess() {
        let val = 123
        let predicate = NSPredicate(format: "key < %d", val)
        XCTAssertEqual(predicate, "key".pred.less(123))
    }
    
    func testLess2() {
        let val = 123
        let predicate = NSPredicate(format: "key < %d", val)
        XCTAssertEqual(predicate, "key".pred < 123)
    }
     
    func testLessThanEquals() {
        let val = 123
        let predicate = NSPredicate(format: "key <= %d", val)
        XCTAssertEqual(predicate, "key".pred.lessThanEquals(123))
    }
    
    func testLessThanEquals2() {
        let val = 123
        let predicate = NSPredicate(format: "key <= %d", val)
        XCTAssertEqual(predicate, "key".pred <= val)
    }
     
    func testEqDate() {
        let val = Date()
        let predicate = NSPredicate(format: "key == %@", val as NSDate)
        XCTAssertEqual(predicate, "key".pred.eq(val))
    }
    
    func testEqDate2() {
        let val = Date()
        let predicate = NSPredicate(format: "key == %@", val as NSDate)
        XCTAssertEqual(predicate, "key".pred == val)
    }
    
    func testGreater() {
        let val = Date()
        let predicate = NSPredicate(format: "key > %@", val as NSDate)
        XCTAssertEqual(predicate, "key".pred.greater(val))
    }
      
    func testGreater2() {
        let val = Date()
        let predicate = NSPredicate(format: "key > %@", val as NSDate)
        XCTAssertEqual(predicate, "key".pred > val)
    }
    
    func testGreaterThanEquals() {
        let val = Date()
        let predicate = NSPredicate(format: "key >= %@", val as NSDate)
        XCTAssertEqual(predicate, "key".pred.greaterThanEquals(val))
    }
     
    func testGreaterThanEquals2() {
        let val = Date()
        let predicate = NSPredicate(format: "key >= %@", val as NSDate)
        XCTAssertEqual(predicate, "key".pred >= val)
    }
     
    func testIn1() {
        let val = [1,2,3]
        let predicate = NSPredicate(format: "SELF in %@", val)
        XCTAssertEqual(predicate, "SELF".pred.in(val))
    }
    
    func testBetween() {
        let val = [1,10]
        let predicate = NSPredicate(format: "attr between %@", val as NSArray)
        XCTAssertEqual(predicate, "attr".pred.between(val))
    }
    
    func testBeginWith() {
        let val = "prefix"
        let predicate = NSPredicate(format: "attr beginswith %@", val)
        XCTAssertEqual(predicate, "attr".pred.beginsWith(val))
    }
    
    func testBeginWithC() {
        let val = "prefix"
        let predicate = NSPredicate(format: "attr beginswith[c] %@", val)
        XCTAssertEqual(predicate, "attr".pred.beginsWith(val, options: .c))
    }
    
    func testBeginWithD() {
        let val = "prefix"
        let predicate = NSPredicate(format: "attr beginswith[d] %@", val)
        XCTAssertEqual(predicate, "attr".pred.beginsWith(val, options: .d))
    }
    
    func testBeginWithCD() {
        let val = "prefix"
        let predicate = NSPredicate(format: "attr beginswith[cd] %@", val)
        XCTAssertEqual(predicate, "attr".pred.beginsWith(val, options: .cd))
    }
    
    func testAny() {
        let predicate = NSPredicate(format: "ANY employees.firstname LIKE 'Matthew'")
        XCTAssertEqual(predicate, pred.any("employees.firstname").like("Matthew"))
    }
    
    func testNot() {
        let predicate = NSPredicate(format: "NOT attr == 123")
        XCTAssertEqual(predicate, !("attr".pred.eq(123)))
    }
    
    func testAve() {
        let predicate = NSPredicate(format: "expenses.@avg.doubleValue > 123")
        XCTAssertEqual(predicate, "expenses".pred.avg(.doubleValue).greater(123))
    }
    
    func testAnd() {
        let val = "str"
        let predicate = NSPredicate(format: "a == 1 AND b != %@", val)
        XCTAssertEqual(predicate, "a".pred == 1 && "b".pred != val)
    }
    
    func testOr() {
        let val = "str"
        let predicate = NSPredicate(format: "a == 1 OR b != %@", val)
        XCTAssertEqual(predicate, "a".pred == 1 || "b".pred != val)
    }
    
    func testAndOr() {
        let val = "str"
        let predicate = NSPredicate(format: "a == 1 AND b != %@ OR c == 123", val)
        XCTAssertEqual(predicate, "a".pred == 1 && "b".pred != val || "c".pred == 123)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
