//
//  CustomButton.swift
//  Adilet
//
//  Created by Shohkarim Mamadnazar on 5/6/19.
//  Copyright © 2019 Shohkarim Mamadnazar. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCustomButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupCustomButton()
    }
    
    private func setupCustomButton() {
        backgroundColor = Colors.gray
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = frame.height / 2
    }
}
