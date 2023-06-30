//
//  SketsaModel.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 26/06/23.
//

import Foundation
import CloudKit

class SketsaModel : Identifiable {
    static let recordType = "SketsaModel"
    var recordId: CKRecord.ID
    let sketsaDepanImg: String
    let sketsaBelakangImg: String
    
    init?(record: CKRecord) {
        guard
            let sketsaDepanImg = record["sketsaDepanImg"] as? String,
            let sketsaBelakangImg = record["sketsaBelakangImg"] as? String
        else { return nil }
        
        recordId = record.recordID
        self.sketsaDepanImg = sketsaDepanImg
        self.sketsaBelakangImg = sketsaBelakangImg
        
    }
}


extension SketsaModel : Hashable {
    static func == (sketsa1 : SketsaModel, sketsa2 : SketsaModel) -> Bool {
        return sketsa1.recordId == sketsa2.recordId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(recordId)
    }
}
