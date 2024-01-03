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
        var bowlingFrame = BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 5))
        XCTAssertEqual(bowlingFrame.getScore(), 15, "Score should be 15")
    }
    
    func test_singleFrameStrikeFalseCase() {
        var bowlingFrame = BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 5))
        XCTAssertFalse(bowlingFrame.isStrike(bowlingFrame.firstTry))
    }
    
    func test_singleFrameStrikeTrueCase() {
        var bowlingFrame = BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 10), secondTry: BowlingTry(knockedPins: 5))
        XCTAssertTrue(bowlingFrame.isStrike(bowlingFrame.firstTry))
    }
    
    func test_singleFrameSpareTrueCase() {
        var bowlingFrame = BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 5))
        XCTAssertTrue(bowlingFrame.isSpare(bowlingFrame.firstTry, bowlingFrame.secondTry))
    }
    
    func test_singleFrameSpareFalseCase() {
        var bowlingFrame = BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 4))
        XCTAssertFalse(bowlingFrame.isSpare(bowlingFrame.firstTry, bowlingFrame.secondTry))
    }

}
