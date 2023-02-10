//
//  UIStackVIew + ext.swift
//  TheWeather
//
//  Created by Айдар Оспанов on 07.02.2023.
//

import UIKit

extension UIStackView {

    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution = .fillEqually) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
