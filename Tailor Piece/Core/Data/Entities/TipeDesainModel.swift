//
//  TipeDesainModel.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 28/06/23.
//

import Foundation
import CloudKit

class TipeDesainModel : Identifiable {
    static let recordType = "TipeDesainModel"
    var recordId: CKRecord.ID
    let bentukPakaian: String
    let lengan: String
    let leher: String
    let celana: String
    
    init?(record: CKRecord) {
        guard
            let bentukPakaian = record["bentukPakaian"] as? String,
            let lengan = record["lengan"] as? String,
            let leher = record["leher"] as? String,
            let celana = record["celana"] as? String
        else { return nil }
        
        recordId = record.recordID
        self.bentukPakaian = bentukPakaian
        self.lengan = lengan
        self.leher = leher
        self.celana = celana
    }
}


extension TipeDesainModel : Hashable {
    static func == (tipeDesain1 : TipeDesainModel, tipeDesain2 : TipeDesainModel) -> Bool {
        return tipeDesain1.recordId == tipeDesain2.recordId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(recordId)
    }
}
