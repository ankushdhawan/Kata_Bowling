//
//  Kate_BowlingTests.swift
//  Kate_BowlingTests
//
//  Created by Ankush Dhawan on 03/01/24.
//

import XCTest
@testable import Kate_Bowling

final class KateTDD_BowlingTests: XCTestCase {
    var game: BowlingGame!

    override func setUp() {
        game = BowlingGame(users: [])
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        game = nil
    }

    func test_UserName() {
        var user1 = User(bowlingFrame: [], name: "Ankush")
        XCTAssertEqual(user1.name, "Ankush")
    }
    
    func test_expectWhenNothingPinFall() {
        var frame1 = BowlingFrame(bowlingRoll: BowlingRoll(firstTry: BowlingTry(knockedPins: 0), secondTry: BowlingTry(knockedPins: 0)))
        var user1 = User(bowlingFrame: [frame1], name: "Ankush")
        game = BowlingGame(users: [user1])
        XCTAssertEqual(user1.getTotalScore(), 0, "Score should be 0 when no pin is fall")
    }
    
    func test_expect30WhenStrike() {
        let frame1 = BowlingFrame(bowlingRoll: BowlingRoll(firstTry: BowlingTry(knockedPins: 10), secondTry: BowlingTry(knockedPins: 0)))
        let frame2 = BowlingFrame(bowlingRoll: BowlingRoll(firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 4)))
        let user1 = User(bowlingFrame: [frame1, frame2], name: "Ankush")
        game = BowlingGame(users: [user1])
        XCTAssertEqual(user1.getTotalScore(), 28, "Score should be 28 when Strike")
    }
    
    func test_expectWhenSpare() {
        let frame1 = BowlingFrame(bowlingRoll: BowlingRoll(firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 5)))
        let frame2 = BowlingFrame(bowlingRoll: BowlingRoll(firstTry: BowlingTry(knockedPins: 4), secondTry: BowlingTry(knockedPins: 4)))
        let user1 = User(bowlingFrame: [frame1, frame2], name: "Ankush")
        game = BowlingGame(users: [user1])
        XCTAssertEqual(user1.getTotalScore(), 22, "Score should be 22 when Spare")
    }
    
    func test_expectWhenUserFailToFallAllPins() {
        let frame1 = BowlingFrame(bowlingRoll: BowlingRoll(firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 4)))
        let user1 = User(bowlingFrame: [frame1], name: "Ankush")
        game = BowlingGame(users: [user1])
        XCTAssertEqual(user1.getTotalScore(), 9, "Score should be 10")
    }
    
    func test_compareUserScore() {
        let frame1 = BowlingFrame(bowlingRoll: BowlingRoll(firstTry: BowlingTry(knockedPins: 10), secondTry: BowlingTry(knockedPins: 10)))
        let user1 = User(bowlingFrame: [frame1], name: "Ankush")
        let frame2 = BowlingFrame(bowlingRoll: BowlingRoll(firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 4)))
        let user2 = User(bowlingFrame: [frame2], name: "Vinay")
        XCTAssertGreaterThan(user1.getTotalScore(), user2.getTotalScore(), "User2 Score Should be greater than user1 score")
    }

}
