//
//  MockClothingForm.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 22/06/23.
//

import SwiftUI

struct MockClothingForm: Identifiable, Hashable {
    var id: String { "\(name)_\(clothingType)" }
    let name: String
    let clothingType : String
    let image: String
}
let mockClothingForm: [MockClothingForm] = [
    MockClothingForm(name: "T-Shirt", clothingType: "Bentuk Pakaian", image: "baju"),
    MockClothingForm(name: "Cardigan", clothingType: "Bentuk Pakaian", image: "baju"),
    MockClothingForm(name: "Polo Shirt", clothingType: "Bentuk Pakaian", image: "baju"),
]
