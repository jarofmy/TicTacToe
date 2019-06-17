//
//  InfoView.swift
//  TicTacToe
//
//  Created by Jeremy Van on 2/10/19.
//  Copyright © 2019 Jeremy Van. All rights reserved.
//

import UIKit

class InfoView: UIView {
//    let infoButton = UIButton(type: .infoLight)
//    infoButton.addTarget(self, action: #selector(infoButtonTapped), forControlEvents: .TouchUpInside)

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.backgroundColor = UIColor.cyan.cgColor
        layer.cornerRadius = 20
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 5
        
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: -10, height: 10)
    }

}
