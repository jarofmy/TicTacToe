//
//  GridView.swift
//  TicTacToe
//
//  Created by Jeremy Van on 2/8/19.
//  Copyright © 2019 Jeremy Van. All rights reserved.
//

import UIKit

class GridView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        let lines = UIBezierPath()
        lines.move(to: CGPoint(x: 0, y: height / 3))
        lines.addLine(to: CGPoint(x: width, y: height / 3))
        
        lines.move(to: CGPoint(x: 0, y: height / 3 * 2))
        lines.addLine(to: CGPoint(x: width, y:  height / 3 * 2))
        
        lines.move(to: CGPoint(x: width / 3, y: 0))
        lines.addLine(to: CGPoint(x: width / 3, y:  height))
        
        lines.move(to: CGPoint(x: width / 3 * 2, y: 0))
        lines.addLine(to: CGPoint(x: width / 3 * 2, y:  height))
        
        lines.lineWidth = 10
        UIColor.purple.setStroke()
        lines.stroke()
        
    }
}
