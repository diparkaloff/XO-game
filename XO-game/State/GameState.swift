//
//  GameState.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 17.06.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

protocol GameState {
    var isMoveCompleted: Bool { get }
    func addSign(at position: GameboardPosition)
    func begin()
}
