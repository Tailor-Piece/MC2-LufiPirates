//
//  MockNeckForm.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 22/06/23.
//

import SwiftUI

struct MockNeckForm: Identifiable, Hashable {
    var id: String { "\(name)_\(clothingType)" }
    let name: String
    let clothingType : String
    let image: String
}
let mockNeckForm: [MockNeckForm] = [
    MockNeckForm(name: "T-Shirt", clothingType: "Bentuk Pakaian", image: "baju"),
    MockNeckForm(name: "Cardigan", clothingType: "Bentuk Pakaian", image: "baju"),
    MockNeckForm(name: "Polo Shirt", clothingType: "Bentuk Pakaian", image: "baju"),
]
