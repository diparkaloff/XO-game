//
//  Gameboard.swift
//  XO-game
//
//  Created by Дмитрий Паркалов on 31.08.22.

import Foundation

public final class Gameboard {
    
    // MARK: - Properties
    
    private lazy var positions: [[Player?]] = initialPositions()
    
    public var selectedPositions: [Player : [GameboardPosition]] = [:]
    public var stepsCount: [Player : Int] = [:]
    
    // MARK: - public
    
    public func setPlayer(_ player: Player, at position: GameboardPosition) {
        positions[position.column][position.row] = player
    }
    
    public func clear() {
        resetPositions()
        selectedPositions = [:]
        stepsCount = [:]
    }
    
    public func resetPositions() {
        self.positions = initialPositions()
    }
    
    public func contains(player: Player, at positions: [GameboardPosition]) -> Bool {
        for position in positions {
            guard contains(player: player, at: position) else {
                return false
            }
        }
        return true
    }
    
    public func contains(player: Player, at position: GameboardPosition) -> Bool {
        let (column, row) = (position.column, position.row)
        return positions[column][row] == player
    }
    
    public func add(position: GameboardPosition, for player: Player) {
        if stepsCount[player] == nil {
            selectedPositions[player] = [position]
            stepsCount[player] = 1
        } else {
            selectedPositions[player]?.append(position)
            stepsCount[player] = stepsCount[player]! + 1
        }
    }
    
    public func isStepsCompleted(player: Player) -> Bool {
        return stepsCount[player] == BlindfoldStepsCount.steps
    }
    
    // MARK: - Private
    
    private func initialPositions() -> [[Player?]] {
        var positions: [[Player?]] = []
        for _ in 0 ..< GameboardSize.columns {
            let rows = Array<Player?>(repeating: nil, count: GameboardSize.rows)
            positions.append(rows)
        }
        return positions
    }
}
