//
//  User.swift
//  Kate_Bowling
//
//  Created by Ankush Dhawan on 03/01/24.
//

import Foundation

class User {
    var rolls:[BowlingRoll]
    var name:String
    init(rolls: [BowlingRoll], name: String) {
        self.rolls = rolls
        self.name = name
    }
    func getTotalScore() -> Int {
        return rolls.compactMap { $0.bowlingFrame.getScore() }.reduce(0, +)
    }
}
