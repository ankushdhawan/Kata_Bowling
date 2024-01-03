//
//  BowlingFrame.swift
//  Kate_Bowling
//
//  Created by Ankush Dhawan on 03/01/24.
//

import Foundation

class BowlingRoll {
    var firstTry:BowlingTry
    var secondTry:BowlingTry
    var thirdTry:BowlingTry?
    var isLastFrame:Bool
    init(firstTry: BowlingTry, secondTry: BowlingTry, isLastFrame:Bool = false, thirdTry:BowlingTry? = nil) {
        self.firstTry = firstTry
        self.secondTry = secondTry
        self.isLastFrame = isLastFrame
        self.thirdTry = thirdTry
    }
    
    func getScore() -> Int {
        if isStrike(firstTry) {
            return 10
        } else if isLastFrame , (isStrike(firstTry) || isSpare(firstTry, secondTry)) {
            return firstTry.knockedPins + secondTry.knockedPins + (thirdTry?.knockedPins ?? 0)
        }
        return firstTry.knockedPins + secondTry.knockedPins
    }
    
    func isSpare(_ bowlingFirstTry: BowlingTry, _ bowlingSecondTry: BowlingTry) -> Bool {
        return bowlingFirstTry.knockedPins + bowlingSecondTry.knockedPins == 10 ? true : false
    }

    func isStrike(_ bowlingTry: BowlingTry) -> Bool {
        return bowlingTry.knockedPins == 10 ? true : false
    }
    
}
