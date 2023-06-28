//
//  UkuranBadanRepository.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 27/06/23.
//

import Foundation
import CloudKit

class UkuranBadanRepository {
    let container: CKContainer
    let publicDB: CKDatabase
    
    init() {
        container = CKContainer(identifier: "iCloud.com.salsaachinanti.TailorPiece")
        publicDB = container.publicCloudDatabase
    }
    
    func saveUkuranBadan(
        lingkarBadan: Int,
        panjangDada: Int,
        lebarDada: Int,
        tinggiDada: Int,
        panjangPunggung: Int,
        lebarPunggung: Int,
        lebarBahu: Int,
        panjangCelana: Int,
        panjangLutut: Int,
        lingkarPanggul: Int,
        lingkarPesak: Int,
        SetengahLingkarPaha: Int,
        SetengahLingkarLutut: Int,
        SetengahLingkarKaki: Int,
        lingkarPinggang: Int,
        lingkarPinggul: Int
        , completion: @escaping (Result<Bool, Error>) -> Void) async throws -> UkuranBadanModel? {
        do {
            let newRecord = CKRecord(recordType: UkuranBadanModel.recordType)
            newRecord.setValuesForKeys([
                "lingkarBadan" : lingkarBadan,
                "panjangDada" : panjangDada,
                "lebarDada" : lebarDada,
                "tinggiDada" : tinggiDada,
                "panjangPunggung" : panjangPunggung,
                "lebarPunggung" : lebarPunggung,
                "lebarBahu" : lebarBahu,
                "panjangCelana" : panjangCelana,
                "panjangLutut" : panjangLutut,
                "lingkarPanggul" : lingkarPanggul,
                "lingkarPesak" : lingkarPesak,
                "setengahLingkarPaha" : SetengahLingkarPaha,
                "setengahLingkarLutut" : SetengahLingkarLutut,
                "setengahLingkarKaki" : SetengahLingkarKaki,
                "lingkarPinggang" : lingkarPinggang,
                "lingkarPinggul" : lingkarPinggul
            ])
            let record = try await publicDB.save(newRecord)
            completion(Result.success(true))
            return UkuranBadanModel(record: record)
        } catch {
            completion(Result.failure(error))
            return nil
        }
    }
        
//    func getBodySizes(completion: @escaping (Result<Bool, Error>) -> Void) async throws -> [BodySizeModel]? {
//        do {
//            let predicate = NSPredicate(value: true)
//            let query = CKQuery(recordType: BodySizeModel.recordType, predicate: predicate)
//            let results = try await publicDB.records(matching: query)
//            let records = results.matchResults.compactMap { try? $0.1.get() }
//
//            var bodySizes = [BodySizeModel]()
//            for record in records {
//                if let bodySize = BodySizeModel(record: record) {
//                    bodySizes.append(bodySize)
//                }
//            }
//
//            completion(Result.success(true))
//            return bodySizes
//        } catch {
//            completion(Result.failure(error))
//            return nil
//        }
//    }
}
