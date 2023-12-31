//
//  UIColor.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 22/06/23.
//

import Foundation
import SwiftUI
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        self.init(
            red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
