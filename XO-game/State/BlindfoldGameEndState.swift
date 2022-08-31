//
//  BlindfoldGameEndState.swift
//  XO-game
//
//  Created by Karahanyan Levon on 27.06.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class BlindfoldGameEndState: GameState {
    
    var isMoveCompleted: Bool = false
    
    weak var gameViewController: GameViewController?
    weak var gameBoard: Gameboard?
    weak var gameBoardView: GameboardView?
    
    init(gameViewController: GameViewController,
         gameBoard: Gameboard,
         gameBoardView: GameboardView) {
        self.gameViewController = gameViewController
        self.gameBoard = gameBoard
        self.gameBoardView = gameBoardView
    }
    
    func addSign(at position: GameboardPosition) { }
    
    func begin() {
        guard
            let selectedFirstPlayerPositions = gameBoard?.selectedPositions[.first],
            let selectedSecondPlayerPositions = gameBoard?.selectedPositions[.second]
        else { return }
        
        var dict: [GameboardPosition : Player] = [:]
        
        for i in 0...BlindfoldStepsCount.steps - 1 {
            dict[selectedFirstPlayerPositions[i]] = .first
            dict[selectedSecondPlayerPositions[i]] = .second
        }
        
        for (key, value) in dict {
            addSign(at: key, for: value)
        }
        
        isMoveCompleted = true
    }
    
    private func addSign(at position: GameboardPosition, for player: Player) {
        guard let gameBoardView = gameBoardView else { return }
        
        gameBoard?.setPlayer(player, at: position)
        gameBoardView.placeMarkView(player.markViewPrototype.copy(), at: position)
    }
}
