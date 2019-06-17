//
//  Grid.swift
//  TicTacToe
//
//  Created by Jeremy Van on 2/13/19.
//  Copyright © 2019 Jeremy Van. All rights reserved.
//

import UIKit


class Grid {
    // MARK: Properties
    var activePlayer: Int
    var gameActive: Bool
    var gridSquares: [Int]
    var winner: Int
    let winningCombinations = [[1,3,2], [5,6,0], [7,4,8], [1,5,7], [3,6,4], [2,0,8], [1,6,8], [2,6,7]]
    
    // Initial stored properties
    init(activePlayer: Int = 1, gameActive: Bool = true, gridSquares: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0], winner: Int = 0) {
        self.activePlayer = activePlayer
        self.gameActive = gameActive
        self.gridSquares = gridSquares
        self.winner = winner
    }
    
    func clearGrid() {
        gridSquares.removeAll()
    }
    
    func didWin(activePlayer: Int) {
        for combinations in winningCombinations {
            var count = 0
            for i in combinations {
                if self.gridSquares[i] == activePlayer {
                    count += 1
                }
                if count == 3 {
                    winner = activePlayer
                    gameActive = false
                }
            }
        }
    }
}

