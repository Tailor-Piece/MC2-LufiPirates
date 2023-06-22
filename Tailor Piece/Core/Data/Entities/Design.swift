//
//  Design.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 21/06/23.

import Foundation
import CloudKit

struct Design {
    var designId: CKRecord.ID?
    let dateCreated: Date
    let gender : Gender
    let bodySize: CKRecord.ReferenceAction
    let clothingType: ClothingType
    let patterns : String
    
    init(designId: CKRecord.ID? = nil, dateCreated: Date, gender: Gender, bodySize: CKRecord.ReferenceAction, clothingType: ClothingType, patterns : String) {
        self.designId = designId
        self.dateCreated = dateCreated
        self.gender = gender
        self.bodySize = bodySize
        self.clothingType = clothingType
        self.patterns = patterns
    }
    
    func toDictionary() -> [String: Any] {
        return ["dateCreated":dateCreated,
                "gender":gender.rawValue,
                "bodySize":bodySize.recordI,
                "clothingType":clothingType.rawValue,
                "patterns":patterns]
    }
    
    static func fromRecord(_ record: CKRecord) -> Design? {
        guard
            let dateCreated = record.value(forKey: "dateCreated") as? Date,
            let gender = Gender(rawValue: record.value(forKey: "gender") as! String),
            let bodySizeReference = record.value(forKey: "bodySize") as? CKRecord.ReferenceAction,
            let bodySizeID = bodySizeReference.recordID,
            let clothingType = ClothingType(rawValue: record.value(forKey: "clothingType") as! String),
            let pattern = record.value(forKey: "patterns") as? String
        else {
            return nil
        }
        
        return Design(
            designId: record.recordID,
            dateCreated: dateCreated,
            gender: gender,
            bodySize: CK(recordID: bodySizeID, action: .none),
            clothingType: clothingType,
            patterns: pattern)
    }
}
