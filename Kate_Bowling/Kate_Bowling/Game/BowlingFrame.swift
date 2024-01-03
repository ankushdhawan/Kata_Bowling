//
//  BowlingFrame.swift
//  Kate_Bowling
//
//  Created by Ankush Dhawan on 03/01/24.
//

import Foundation

class BowlingFrame {
    var totalPins:Int
    var firstTry:BowlingTry
    var secondTry:BowlingTry

    init(totalPins: Int, firstTry: BowlingTry, secondTry: BowlingTry) {
        self.totalPins = totalPins
        self.firstTry = firstTry
        self.secondTry = secondTry
    }
    
    func checkEnteredKnockedPinIsValid() throws {
        if firstTry.knockedPins > totalPins {
            throw GameError.wrongInput("knockedPins cannot be greater than total pins")
        } else if secondTry.knockedPins > totalPins {
            throw GameError.wrongInput("knockedPins cannot be greater than total pins")
        } else if firstTry.knockedPins + secondTry.knockedPins > totalPins {
            throw GameError.wrongInput("First Try knockedPins and secondry Try knockedPins cannot be greater than total pins")
        }
    }
    
    func getScore() -> Int {
        var roll = 0
        var spareBonus = 0
        var strikeBonus = 0
        var bonus = 0
        if isStrike(firstTry) {
            strikeBonus = 30
            return strikeBonus
        } else if isSpare(firstTry, secondTry) {
            return firstTry.knockedPins + 10
        } else {
            bonus = firstTry.knockedPins + secondTry.knockedPins
            return bonus
        }
    }
    
    func isSpare(_ bowlingFirstTry: BowlingTry, _ bowlingSecondTry: BowlingTry) -> Bool {
        return bowlingFirstTry.knockedPins + bowlingSecondTry.knockedPins == totalPins ? true : false
    }

    func isStrike(_ bowlingTry: BowlingTry) -> Bool {
        return bowlingTry.knockedPins == totalPins ? true : false
    }
    
}
