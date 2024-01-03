//
//  Kate_BowlingFrameTests.swift
//  Kate_BowlingTests
//
//  Created by Ankush Dhawan on 03/01/24.
//

import XCTest
@testable import Kate_Bowling

final class Kate_BowlingFrameTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_singleFrameScore() {
        var bowlingRoll = BowlingRoll(firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 5))
        XCTAssertEqual(bowlingRoll.getScore(), 10, "Score should be 15")
    }
    
    func test_singleFrameStrikeFalseCase() {
        var bowlingRoll = BowlingRoll(firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 5))
        XCTAssertFalse(bowlingRoll.isStrike(bowlingRoll.firstTry))
    }
    
    func test_singleFrameStrikeTrueCase() {
        var bowlingRoll = BowlingRoll(firstTry: BowlingTry(knockedPins: 10), secondTry: BowlingTry(knockedPins: 5))
        XCTAssertTrue(bowlingRoll.isStrike(bowlingRoll.firstTry))
    }
    
    func test_singleFrameSpareTrueCase() {
        var bowlingRoll = BowlingRoll(firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 5))
        XCTAssertTrue(bowlingRoll.isSpare(bowlingRoll.firstTry, bowlingRoll.secondTry))
    }
    
    func test_singleFrameSpareFalseCase() {
        var bowlingRoll = BowlingRoll(firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 4))
        XCTAssertFalse(bowlingRoll.isSpare(bowlingRoll.firstTry, bowlingRoll.secondTry))
    }

}
