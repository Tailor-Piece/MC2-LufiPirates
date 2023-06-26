//
//  Order.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 21/06/23.
//

import Foundation
import CloudKit

struct Order {
    var orderID: CKRecord.ID?
    let dateCreated: Date
    let gender : String
    let bodySize: String
    let clothingType: String
    let patterns : String
    
    init(orderId: CKRecord.ID? = nil, dateCreated: Date, gender: String, bodySize: String, clothingType: String, patterns : String) {
        self.dateCreated = dateCreated
        self.gender = gender
        self.bodySize = bodySize
        self.clothingType = clothingType
        self.patterns = patterns
    }
    
    func toDictionary() -> [String: Any] {
        return ["dateCreated":dateCreated, "gender":gender, "bodySize":bodySize, "clothingType":clothingType,"patterns":patterns]
    }
    
    static func fromRecord(_ record: CKRecord) -> Order? {
        guard
            let dateCreated = record.value(forKey: "dateCreated") as? Date,
            let gender = record.value(forKey: "gender") as? String,
            let bodySize = record.value(forKey: "bodySize") as? String,
            let clothingType = record.value(forKey: "clothingType") as? String,
            let pattern = record.value(forKey: "patterns") as? String
        else {
            return nil
        }
        
        return Order(orderId:record.recordID, dateCreated: dateCreated, gender: gender, bodySize: bodySize, clothingType: clothingType, patterns: pattern)
    }
}
