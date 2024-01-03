//
//  User.swift
//  Kate_Bowling
//
//  Created by Ankush Dhawan on 03/01/24.
//

import Foundation

class User {
    var bowlingFrame:[BowlingFrame]
    var name:String
    init(bowlingFrame: [BowlingFrame], name: String) {
        self.bowlingFrame = bowlingFrame
        self.name = name
    }
    func getTotalScore() -> Int {
        var spareBonus = 0
        var strikeBonus = 0
        for i in 0...bowlingFrame.count - 1 {
            if isStrike(bowlingFrame[i].bowlingRoll.firstTry) && i + 1 < bowlingFrame.count{
                strikeBonus += bowlingFrame[i + 1].bowlingRoll.firstTry.knockedPins +  bowlingFrame[i + 1].bowlingRoll.secondTry.knockedPins
            } else if isSpare(bowlingFrame[i].bowlingRoll.firstTry, bowlingFrame[i].bowlingRoll.secondTry) && i + 1 < bowlingFrame.count  {
                spareBonus += bowlingFrame[i + 1].bowlingRoll.firstTry.knockedPins
            }
            
        }
        return  bowlingFrame.compactMap { $0.bowlingRoll.getScore() }.reduce(0, +) + spareBonus + strikeBonus
    }
    
    func isSpare(_ bowlingFirstTry: BowlingTry, _ bowlingSecondTry: BowlingTry) -> Bool {
        return bowlingFirstTry.knockedPins + bowlingSecondTry.knockedPins == 10 ? true : false
    }

    func isStrike(_ bowlingTry: BowlingTry) -> Bool {
        return bowlingTry.knockedPins == 10 ? true : false
    }
}
