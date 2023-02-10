//
//  UILabel + ext.swift
//  TheWeather
//
//  Created by Айдар Оспанов on 07.02.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?, textAlignment: NSTextAlignment = .left, textColor: UIColor = .black) {
        self.init()
        
        self.text = text
        self.font = font
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
