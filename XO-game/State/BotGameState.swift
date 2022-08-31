//
//  BotGameState.swift
//  XO-game
//
//  Created by Karahanyan Levon on 25.06.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class BotGameState: PlayerState {
    
    var isMoveCompleted: Bool = false
    
    public var player: Player
    weak var gameViewController: GameViewController?
    weak var gameBoard: Gameboard?
    weak var gameBoardView: GameboardView?
    
    let markViewPrototype: MarkView
    
    init(player: Player,
         gameViewController: GameViewController,
         gameBoard: Gameboard,
         gameBoardView: GameboardView,
         markViewPrototype: MarkView) {
        self.player = player
        self.gameViewController = gameViewController
        self.gameBoard = gameBoard
        self.gameBoardView = gameBoardView
        self.markViewPrototype = markViewPrototype
    }
    
    func addSign(at position: GameboardPosition) {
        guard let gameBoardView = gameBoardView, gameBoardView.canPlaceMarkView(at: position) else { return }
        
        Logger.shared.log(action: .playerSetSign(player: player, position: position))
        gameBoard?.setPlayer(player, at: position)
        gameBoardView.placeMarkView(markViewPrototype.copy(), at: position)
        gameBoardView.deleteFromAllPossiblePositions(position: position)
        isMoveCompleted = true
    }
    
    func begin() {
        switch player {
        case .first:
            gameViewController?.firstPlayerTurnLabel.isHidden = false
            gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second:
            gameViewController?.firstPlayerTurnLabel.isHidden = true
            gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        
        gameViewController?.winnerLabel.isHidden = true
        
        if let randomPosition = gameBoardView?.getRandomPossiblePosition() {
            addSign(at: randomPosition)
        }
        
        gameViewController?.nextPlayerTurn()
    }
}
