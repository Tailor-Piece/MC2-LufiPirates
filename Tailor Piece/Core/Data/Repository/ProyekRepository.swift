//
//  ProyekRepository.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 27/06/23.
//

import Foundation
import CloudKit

class ProyekRepository {
    let container: CKContainer
    let publicDB: CKDatabase
    
    init() {
        container = CKContainer(identifier: "iCloud.com.salsaachinanti.TailorPiece")
        publicDB = container.publicCloudDatabase
    }
    
    func saveTipeDesain(tipeDesain: [String: String], completion: @escaping (Result<Bool, Error>) -> Void) async throws -> TipeDesainModel? {
        do {
            let newRecord = CKRecord(recordType: TipeDesainModel.recordType)
            newRecord.setValuesForKeys([
                "bentukPakaian": tipeDesain["bentukPakaian"]!,
                "lengan": tipeDesain["lengan"]!,
                "leher": tipeDesain["leher"]!,
                "celana": tipeDesain["celana"]!,
            ])
            let record = try await publicDB.save(newRecord)
            completion(Result.success(true))
            return TipeDesainModel(record: record)
        } catch {
            completion(Result.failure(error))
            return nil
        }
    }
        
    
    func saveSketsa(sketsaDepanImg: String, sketsaBelakangImg: String, completion: @escaping (Result<Bool, Error>) -> Void) async throws -> SketsaModel? {
        do {
            let newRecord = CKRecord(recordType: SketsaModel.recordType)
            newRecord.setValuesForKeys([
                "sketsaDepanImg":  sketsaDepanImg,
                "sketsaBelakangImg":  sketsaBelakangImg,
            ])
            let record = try await publicDB.save(newRecord)
            completion(Result.success(true))
            return SketsaModel(record: record)
        } catch {
            completion(Result.failure(error))
            return nil
        }
    }
        
    func save(namaProyek:String, dateCreated: Date, jenisPakaian: String, ukuranBadan: UkuranBadanModel?, tipeDesain:TipeDesainModel?, sketsa: SketsaModel?, completion: @escaping (Result<Bool, Error>) -> Void) async throws -> ProyekModel? {
        do {
            let newProyek = CKRecord(recordType: ProyekModel.recordType)
            newProyek.setValue(namaProyek, forKey: "namaProyek")
            newProyek.setValue(dateCreated, forKey: "dateCreated")
            newProyek.setValue(jenisPakaian, forKey: "jenisPakaian")
            
            if let ukuranBadan = ukuranBadan {
                let ukuranBadanReference = CKRecord.Reference(recordID: ukuranBadan.recordId, action: .deleteSelf)
                newProyek.setValue(ukuranBadanReference, forKey: "ukuranBadan")
            }
            
            if let tipeDesain = tipeDesain {
                let tipeDesainReference = CKRecord.Reference(recordID: tipeDesain.recordId, action: .deleteSelf)
                newProyek.setValue(tipeDesainReference, forKey: "tipeDesain")
            }
            
            if let sketsa = sketsa {
                let sketsaReference = CKRecord.Reference(recordID: sketsa.recordId, action: .deleteSelf)
                newProyek.setValue(sketsaReference, forKey: "sketsa")
            }
                        
            let record = try await publicDB.save(newProyek)
            completion(Result.success(true))
            return await ProyekModel(record: record)
        } catch {
            completion(Result.failure(error))
            return nil
        }
    }
    
    func getAllProyek(completion: @escaping (Result<Bool, Error>) -> Void) async throws -> [ProyekModel]? {
        do {
            let predicate = NSPredicate(value: true)
            let query = CKQuery(recordType: ProyekModel.recordType, predicate: predicate)
            let results = try await publicDB.records(matching: query)
            let records = results.matchResults.compactMap { try? $0.1.get() }
                    
            var allProyek = [ProyekModel]()
            for record in records {
                if let proyek = await ProyekModel(record: record) {
                    allProyek.append(proyek)
                }
            }
            completion(Result.success(true))
            return allProyek
        } catch {
            completion(Result.failure(error))
            return nil
        }
    }
//
//    func updateNamaProyek(id:CKRecord.ID, namaProyek:String, completion: @escaping (Result<Bool, Error>) -> Void) async throws -> [ProyekModel]? {
//        do {
//            let predicate = NSPredicate(value: true)
//            let query = CKQuery(recordType: ProyekModel.recordType, predicate: predicate)
//            let results = try await publicDB.records(matching: query)
//            let records = results.matchResults.compactMap { try? $0.1.get() }
//
//            var allProyek = [ProyekModel]()
//            for record in records {
//                if let proyek = await ProyekModel(record: record) {
//                    allProyek.append(proyek)
//                }
//            }
//            completion(Result.success(true))
//            return allProyek
//        } catch {
//            completion(Result.failure(error))
//            return nil
//        }
//    }
    
//    func updateNamaProyek(id: CKRecord.ID, namaProyek: String, completion: @escaping (Result<Bool, Error>) -> Void) async throws -> [ProyekModel]? {
//        do {
//            let predicate = NSPredicate(format: "recordID == %@", id)
//            let query = CKQuery(recordType: ProyekModel.recordType, predicate: predicate)
//            let results = try await publicDB.records(matching: query)
//            let records = results.matchResults.compactMap { try? $0.1.get() }
//                    
//            
//            records.setValuesForKeys([
//                "namaProyek": namaProyek,
//            ])
//            try await publicDB.save(records)
//            
//            completion(.success(true))
//            return allProyek
//        } catch {
//            completion(.failure(error))
//            return nil
//        }
//    }
    
    func updateNamaProyek(id:CKRecord.ID,namaProyek: String) async -> Void{

        let predicate = NSPredicate(format: "recordID == %@", id)
        // Record typenya berdasarkan apa
        let query = CKQuery(recordType: "DataUser", predicate: predicate)

        do{
            let resultRecords = try await publicDB.records(matching: query, desiredKeys: nil)



            guard let record = resultRecords.matchResults.first else {
                // Data user not found
                return
            }
            let finalRecord = try record.1.get()
            finalRecord.setValuesForKeys([
                "namaProyek": namaProyek,
            ])
            try await publicDB.save(finalRecord)
        }catch let err{
            print("Error fetching data from CloudKit: \(err.localizedDescription)")
            return
        }
    }
//
    
}

