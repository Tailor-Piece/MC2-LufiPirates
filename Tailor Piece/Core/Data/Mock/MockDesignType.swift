//
//  MockDesignType.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 22/06/23.
//

import SwiftUI

struct MockDesignType: Identifiable, Hashable {
    var id: String { "\(name)_\(clothingType)" }
    let name: String
    let clothingType : String
    let image: String
}
let mockDesignType: [MockDesignType] = [
    MockDesignType(name: "T-Shirt", clothingType: "Bentuk Pakaian", image: "baju"),
    MockDesignType(name: "Cardigan", clothingType: "Bentuk Pakaian", image: "baju"),
    MockDesignType(name: "Polo Shirt", clothingType: "Bentuk Pakaian", image: "baju"),
    MockDesignType(name: "Short Sleeve", clothingType: "Lengan", image: "lengan"),
    MockDesignType(name: "Long Sleeve", clothingType: "Lengan", image: "lengan"),
    MockDesignType(name: "Sleeve less", clothingType: "Lengan", image: "lengan"),
    MockDesignType(name: "Short Sleeve", clothingType: "Lengan", image: "lengan"),
    MockDesignType(name: "Long Sleeve", clothingType: "Lengan", image: "lengan"),
    MockDesignType(name: "Sleeve less", clothingType: "Lengan", image: "lengan"),
    
]

