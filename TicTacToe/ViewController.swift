//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jeremy Van on 2/8/19.
//  Copyright © 2019 Jeremy Van. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let grid: Grid = Grid()

    @IBOutlet var squares: [UIImageView]!
    @IBOutlet weak var xpiece: UIImageView!
    @IBOutlet weak var opiece: UIImageView!
    var initialCenter = CGPoint()
    var activePlayer: Int = 1
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var animatedView: UIView! {
        didSet {
            animatedView.frame.origin.y = -animatedView.frame.size.height-300
        }
    }
    @IBAction func infoButton(_ sender: UIButton) {
        infoLabel.text = "Get 3 in a row to win!"
        animateWin()
    }
    
    func animateWin() {
        animator = UIViewPropertyAnimator(duration: 0.4, curve: .easeIn) {
            self.animatedView.center.y = self.view.center.y
        }
        animator.startAnimation()
    }
    
    @IBAction func infoConfirmButton(_ sender: UIButton) {
        animator = UIViewPropertyAnimator(duration: 0.4, curve: .easeIn) {
            self.animatedView.center.y = self.view.center.y + 2000
        }
//        let animator2 = UIViewPropertyAnimator(duration: 0, curve: .easeOut) {
//            self.animatedView.center.y = self.view.center.y - 1000
//        }
        animator.addCompletion { (animatingPosition) in
//            animator2.startAnimation()
            self.animatedView.center.y = -self.animatedView.frame.size.height-300
            if self.grid.winner != 0 {
                for square in self.squares {
                    square.image = UIImage(named: "")
                }
            }
        }
        animator.startAnimation()
    }
    
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        guard let piece = sender.view else { return }
        
        if sender.state == .began {
            self.initialCenter = piece.center
            if piece == opiece {
                xpiece.alpha = 0.5
            } else {
                opiece.alpha = 0.5
            }
        }
        
        let translation = sender.translation(in: view)
        piece.frame.origin.x += translation.x
        piece.frame.origin.y += translation.y
        
        sender.setTranslation(CGPoint(x: 0, y: 0), in: view)
        
        if sender.state == .ended {
            intersectCheck(for: piece)
            UIView.animate(withDuration: 0.5) {
                piece.center = self.initialCenter
            }
            if piece == opiece {
                xpiece.alpha = 1
                activePlayer = 2
            } else {
                opiece.alpha = 1
                activePlayer = 1
            }
            grid.didWin(activePlayer: activePlayer)
//            print(grid.winner)
            if grid.winner != 0 {
                infoLabel.text = "Player \(grid.winner) is the winner!"
                animateWin()
            }
            
        }
    }
    
    func intersectCheck(for piece: UIView) {
        for square in squares {
            if square.image == nil {
                if piece.frame.intersects(square.frame) {
                    if piece == opiece {
                        square.image = UIImage(named: "o")
                        let squareIndex = squares.index(of: square)
                        grid.gridSquares[squareIndex!] = 2
                    }
                    else if piece == xpiece {
                        square.image = UIImage(named: "x")
                        let squareIndex = squares.index(of: square)
                        grid.gridSquares[squareIndex!] = 1
                    }
                }
            }
        }
    }
}

