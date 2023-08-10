//
//  Sign.swift
//  RPS
//
//  Created by Wojuade Abdul Afeez on 08/08/2023.
//

import Foundation

func randomSign() -> Sign{
    let sign = Int.random(in: 0 ... 2)
    switch sign {
    case 0:
        return .rock
    case 1:
        return .paper
    case 2:
        return .scissors
    case _:
        return .paper
        
    }
}
enum Sign {
    case rock, paper, scissors
    
    var emoji : String{
        switch self{
        case .rock:
            return "👊"
        case .paper:
            return "✋🏼"
        case .scissors:
            return "✌🏼"
        }
    }
    
    func determineGameState(opponent: Sign) -> GameState {
            switch (self, opponent) {
            case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
                return .win
            case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
                return .lose
            default:
                return .draw
            }
        }
    
   
    
}
