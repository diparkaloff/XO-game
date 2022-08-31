//
//  LogAction.swift
//  XO-game
//
//  Created by Дмитрий Паркалов on 31.08.22.

import Foundation

enum LogAction {
    case playerSetSign(player: Player, position: GameboardPosition)
    case gameFinish(winner: Player?)
    case restartGame
}
