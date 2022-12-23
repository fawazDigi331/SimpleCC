//
//  BorderView.swift
//  SimpleCurrency
//
//  Created by Fawaz Faiz on 23/12/2022.
//

import UIKit

class BorderView: UIView {

    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
}


