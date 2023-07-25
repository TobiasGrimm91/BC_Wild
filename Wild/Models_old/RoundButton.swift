//
//  RoundButton.swift
//  Wild
//
//  Created by Tobias Schillinger on 28.08.19.
//  Copyright © 2019 Tobias Schillinger. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    
    
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
    
    
    
}
