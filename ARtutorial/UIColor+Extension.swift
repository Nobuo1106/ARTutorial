//
//  UIColor+Extension.swift
//  ARtutorial
//
//  Created by apple on 2022/10/08.
//

import Foundation
import UIKit

extension UIColor {
    static func random() -> UIColor {
        UIColor(displayP3Red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), alpha: 1)
    }
}
