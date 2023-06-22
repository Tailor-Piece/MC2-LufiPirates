//
//  BodySize.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 21/06/23.
//

import Foundation
import CloudKit

struct BodySize {
    var bodySizeId: CKRecord.ID?
    let lingkarBadan: Int
    let lingkarPinggang: Int
    let lebarDada: Int
    
    init(bodySizeId: CKRecord.ID? = nil, lingkarBadan: Int, lingkarPinggang: Int, lebarDada: Int) {
        self.lingkarBadan = lingkarBadan
        self.lingkarPinggang = lingkarPinggang
        self.lebarDada = lebarDada
    }
    
    func toDictionary() -> [String: Int] {
        return ["lingkarBadan":lingkarBadan,
                "lingkarPinggang":lingkarPinggang,
                "lebarDada":lebarDada]
    }
    
    static func fromRecord(_ record: CKRecord) -> BodySize? {
        guard
            let lingkarBadan = record.value(forKey: "lingkarBadan") as? Int,
            let lingkarPinggang = record.value(forKey: "lingkarPinggang") as? Int,
            let lebarDada = record.value(forKey: "lebarDada") as? Int
        else {
            return nil
        }
        
        return BodySize(
            bodySizeId: record.recordID,
            lingkarBadan: lingkarBadan,
            lingkarPinggang: lingkarPinggang,
            lebarDada: lebarDada
        )
    }
}
