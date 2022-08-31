//
//  PlayerState.swift
//  XO-game
//
//  Created by Karahanyan Levon on 25.06.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

protocol PlayerState: GameState {
    var player: Player { get set }
}
