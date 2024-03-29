//
//  GameError.swift
//  Kate_Bowling
//
//  Created by Ankush Dhawan on 03/01/24.
//

import Foundation

enum GameError: Error {
    case wrongInput(String)
    case wrongFrameCount
}
