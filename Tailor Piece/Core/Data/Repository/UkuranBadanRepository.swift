////
////  UkuranBadanRepository.swift
////  Tailor Piece
////
////  Created by Salsabila Zahra Chinanti on 27/06/23.
////
//
//import Foundation
//import CloudKit
//
//class UkuranBadanRepository {
//    let container: CKContainer
//    let publicDB: CKDatabase
//    
//    init() {
//        container = CKContainer(identifier: "iCloud.com.salsaachinanti.TailorPiece")
//        publicDB = container.publicCloudDatabase
//    }
//    
//    func saveUkuranBadan(ukuranBadan:[String:Int], completion: @escaping (Result<Bool, Error>) -> Void) async throws -> UkuranBadanModel? {
//        do {
//            let newRecord = CKRecord(recordType: UkuranBadanModel.recordType)
//            newRecord.setValuesForKeys(ukuranBadan)
//            let record = try await publicDB.save(newRecord)
//            completion(Result.success(true))
//            return UkuranBadanModel(record: record)
//        } catch {
//            completion(Result.failure(error))
//            return nil
//        }
//    }
//}
