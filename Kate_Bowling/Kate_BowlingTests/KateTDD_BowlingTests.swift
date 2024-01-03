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

}
