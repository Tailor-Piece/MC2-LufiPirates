//
//  ClothingType.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 22/06/23.
//

import Foundation

enum ClothingType : String, Codable, CaseIterable {
    case kaos = "Kaos"
    case celana = "Celana"
    case kemeja = "Kemeja"
    case rok = "Rok"
    case dress = "Dress"
    
    static func getWomanClothing() -> [ClothingType] {
        return [ClothingType.rok, ClothingType.dress]
    }
    
    static func getManClothing() -> [ClothingType] {
        return [ClothingType.kaos, ClothingType.celana, ClothingType.kemeja]
    }
}
