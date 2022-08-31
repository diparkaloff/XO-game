//
//  LogCommand.swift
//  XO-game
//
//  Created by Дмитрий Паркалов on 31.08.22.

import Foundation

class LogCommand {
    let action: LogAction
    
    init(action: LogAction) {
        self.action = action
    }
    
    var logMessage: String {
        switch action {
        case .playerSetSign(let player, let position):
            return "\(player) placed sign at position \(position)"
        case .gameFinish(let winner):
            if let winner = winner {
                return "\(winner) wond game"
            } else {
                return "Is draw"
            }
            
        case .restartGame:
            return "Game was restarted"
        }
    }
}
