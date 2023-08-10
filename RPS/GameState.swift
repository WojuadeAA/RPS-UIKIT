//
//  GameState.swift
//  RPS
//
//  Created by Wojuade Abdul Afeez on 08/08/2023.
//

import Foundation
import UIKit

enum GameState {
case start, win, lose, draw
    var toString: String{
        switch self {
        case .win:
           return "You Won"
        case .lose:
           return  "You lost"
        case.draw:
           return  "A draw play again"
        case.start:
            return  "tap options to play"
        }
    }
    var backgroundColor : UIColor {
        switch self {
        case .win:
            return .green
        case .lose:
            return .red
        case.draw:
            return  .gray
        case.start:
            return  .yellow
        }
    }
    
}
