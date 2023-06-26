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
    MockNeckForm(name: "Bulat", clothingType: "Neck", image: "kerah"),
    MockNeckForm(name: "V-Neck", clothingType: "Neck", image: "kerah"),
    MockNeckForm(name: "Kerah", clothingType: "Neck", image: "kerah"),
]
