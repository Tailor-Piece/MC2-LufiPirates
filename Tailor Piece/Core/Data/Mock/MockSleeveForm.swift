//
//  MockSleeveForm.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 22/06/23.
//

import SwiftUI

struct MockSleeveForm: Identifiable, Hashable {
    var id: String { "\(name)_\(clothingType)" }
    let name: String
    let clothingType : String
    let image: String
}
let mockSleeveForm: [MockSleeveForm] = [
    MockSleeveForm(name: "Short Sleeve", clothingType: "Lengan", image: "lengan"),
    MockSleeveForm(name: "Long Sleeve", clothingType: "Lengan", image: "lengan"),
    MockSleeveForm(name: "Sleeve less", clothingType: "Lengan", image: "lengan"),
]
