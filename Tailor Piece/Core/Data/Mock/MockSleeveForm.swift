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
    MockSleeveForm(name: "T-Shirt", clothingType: "Bentuk Pakaian", image: "baju"),
    MockSleeveForm(name: "Cardigan", clothingType: "Bentuk Pakaian", image: "baju"),
    MockSleeveForm(name: "Polo Shirt", clothingType: "Bentuk Pakaian", image: "baju"),
]
