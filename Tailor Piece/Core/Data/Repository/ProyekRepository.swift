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
    
    func saveUkuranBadan(dictukuranBadan:[String:Double?], completion: @escaping (Result<Bool, Error>) -> Void) async throws -> UkuranBadanModel? {
        do {
            let newRecord = CKRecord(recordType: UkuranBadanModel.recordType)
            newRecord.setValuesForKeys(setValueUkuranBadan(dictUkuranBadan: dictukuranBadan))
            let record = try await publicDB.save(newRecord)
            completion(Result.success(true))
            return UkuranBadanModel(record: record)
        } catch {
            completion(Result.failure(error))
            return nil
        }
    }
    
    func setValueUkuranBadan(dictUkuranBadan:[String:Double?]) -> [String:Double?] {
        let dictRecord: [String: Double?] = [
            "lingkarBadan": dictUkuranBadan["Lingkar Badan"] ?? 0,
            "lebarDada": dictUkuranBadan["Lebar Dada"] ?? 0,
            "panjangPunggung": dictUkuranBadan["Panjang Punggung"] ?? 0,
            "lebarPunggung": dictUkuranBadan["Lebar Punggung"] ?? 0,
            "lebarBahu": dictUkuranBadan["Lebar Bahu"] ?? 0,
            "lingkarPangkalLengan": dictUkuranBadan["Lingkar Pangkal Lengan"] ?? 0,
            "lingkarLenganBawah": dictUkuranBadan["Lingkar Lengan Bawah"] ?? 0,
            "panjangLengan": dictUkuranBadan["Panjang Lengan"] ?? 0,
            "panjangCelana": dictUkuranBadan["Panjang Celana"] ?? 0,
            "panjangLutut": dictUkuranBadan["Panjang Lutut"] ?? 0,
            "lingkarPanggul": dictUkuranBadan["Lingkar Panggul"] ?? 0,
            "lingkarPesak": dictUkuranBadan["Lingkar Pesak"] ?? 0,
            "setengahLingkarPaha": dictUkuranBadan["Setengah Lingkar Paha"] ?? 0,
            "setengahLingkarLutut": dictUkuranBadan["Setengah Lingkar Lutut"] ?? 0,
            "setengahLingkarKaki": dictUkuranBadan["Setengah Lingkar Kaki"] ?? 0,
            "lingkarPinggang": dictUkuranBadan["Lingkar Pinggang"] ?? 0,
            "lingkarPinggul": dictUkuranBadan["Lingkar Pinggul"] ?? 0
        ]
        return dictRecord
    }
    
    func saveTipeDesain(tipeDesain: [String: String], completion: @escaping (Result<Bool, Error>) -> Void) async throws -> TipeDesainModel? {
        do {
            let newRecord = CKRecord(recordType: TipeDesainModel.recordType)
            newRecord.setValuesForKeys([
                "bentukPakaian": tipeDesain["Bentuk Pakaian"]!,
                "lengan": tipeDesain["Lengan"]!,
                "leher": tipeDesain["Leher"]!,
                "celana": tipeDesain["Celana"]!,
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
        
    func saveProyek(namaProyek:String, dateCreated: Date, jenisPakaian: String, ukuranBadan: UkuranBadanModel?, tipeDesain:TipeDesainModel?, sketsa: SketsaModel?, completion: @escaping (Result<Bool, Error>) -> Void) async throws -> ProyekModel? {
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
    
}

