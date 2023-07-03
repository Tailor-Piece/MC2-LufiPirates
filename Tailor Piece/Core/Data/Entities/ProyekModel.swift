//
//  ProyekModel.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 27/06/23.
//

import Foundation
import CloudKit

class ProyekModel : Identifiable {
    static let recordType = "ProyekModel"
    var recordId: CKRecord.ID?
    let namaProyek:String
    let dateCreated: Date
    let jenisPakaian: String
    var ukuranBadan: UkuranBadanModel? = nil
    var tipeDesain: TipeDesainModel? = nil
    var sketsa: SketsaModel? = nil
    
    init?(record: CKRecord) async {
    
        guard
            let namaProyek = record["namaProyek"] as? String,
            let dateCreated = record["dateCreated"] as? Date,
            let jenisPakaian = record["jenisPakaian"] as? String,
            let tipeDesainReference = record["tipeDesain"] as? CKRecord.Reference,
            let ukuranBadanReference = record["ukuranBadan"] as? CKRecord.Reference,
            let sketsaReference = record["sketsa"] as? CKRecord.Reference
        else { return nil }
        
        let db = CKContainer(identifier: "iCloud.com.salsaachinanti.TailorPiece").publicCloudDatabase
        
        if let ukuranBadanRecord = try? await db.record(for: ukuranBadanReference.recordID) {
            if let ukuranBadan = UkuranBadanModel(record: ukuranBadanRecord) {
                self.ukuranBadan = ukuranBadan
            }
        }
        
        if let tipeDesainRecord = try? await db.record(for: tipeDesainReference.recordID) {
            if let tipeDesain = TipeDesainModel(record: tipeDesainRecord) {
                self.tipeDesain = tipeDesain
            }
        }
        
        if let sketsaRecord = try? await db.record(for: sketsaReference.recordID) {
            if let sketsa = SketsaModel(record: sketsaRecord) {
                self.sketsa = sketsa
            }
        }
        
        recordId = record.recordID
        self.namaProyek = namaProyek
        self.dateCreated = dateCreated
        self.jenisPakaian = jenisPakaian
    }
}

extension ProyekModel: Hashable {
    static func == (proyek1: ProyekModel, proyek2: ProyekModel) -> Bool {
        return proyek1.recordId == proyek2.recordId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(recordId)
    }
}
