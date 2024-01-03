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
        var user1 = User(rolls: [], name: "Ankush")
        XCTAssertEqual(user1.name, "Ankush")
    }
    
    func test_expectWhenNothingPinFall() {
        var roll1 = BowlingRoll(bowlingFrame: BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 0), secondTry: BowlingTry(knockedPins: 0)))
        var user1 = User(rolls: [roll1], name: "Ankush")
        game = BowlingGame(users: [user1])
        XCTAssertEqual(user1.getTotalScore(), 0, "Score should be 0 when no pin is fall")
    }
    
    func test_expect30WhenStrike() {
        var roll1 = BowlingRoll(bowlingFrame: BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 10), secondTry: BowlingTry(knockedPins: 0)))
        var user1 = User(rolls: [roll1], name: "Ankush")
        game = BowlingGame(users: [user1])
        XCTAssertEqual(user1.getTotalScore(), 30, "Score should be 30 when Strike")
    }
    
    func test_expectWhenSpare() {
        var roll1 = BowlingRoll(bowlingFrame: BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 10)))
        var user1 = User(rolls: [roll1], name: "Ankush")
        game = BowlingGame(users: [user1])
        XCTAssertEqual(user1.getTotalScore(), 15, "Score should be 15 when Spare")
    }
    
    func test_expectWhenUserFailToFallAllPins() {
        var roll1 = BowlingRoll(bowlingFrame: BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 4)))
        var user1 = User(rolls: [roll1], name: "Ankush")
        game = BowlingGame(users: [user1])
        XCTAssertEqual(user1.getTotalScore(), 9, "Score should be 10")
    }
    
    func test_compareUserScore() {
        var roll1 = BowlingRoll(bowlingFrame: BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 4)))
        var roll2 = BowlingRoll(bowlingFrame: BowlingFrame(totalPins: 10, firstTry: BowlingTry(knockedPins: 5), secondTry: BowlingTry(knockedPins: 5)))
        var user1 = User(rolls: [roll1], name: "Ankush")
        var user2 = User(rolls: [roll2], name: "Vinay")
        XCTAssertGreaterThan(user2.getTotalScore(), user1.getTotalScore(), "User2 Score Should be greater than user1 score")
    }

}
