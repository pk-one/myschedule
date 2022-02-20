//
//  UILabel + Extension.swift
//  MyScheduled
//
//  Created by Pavel Olegovich on 20.02.2022.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String, textColor: UIColor, font: UIFont?, textAlignment: NSTextAlignment) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = .left
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
