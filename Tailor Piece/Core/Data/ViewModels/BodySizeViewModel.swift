//
//  BodySizeViewModel.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 21/06/23.
//

import Foundation
import CloudKit


class BodySizeViewModel : ObservableObject {
    private var database: CKDatabase
    private var container: CKContainer
    
    @Published var bodySizes: [BodySizeItemViewModel] = []
    
    init(container: CKContainer){
        self.container = container
        self.database = self.container.publicCloudDatabase
    }
    
    func saveBodySize(lingkarBadan: Int, lingkarPinggang: Int, lebarDada: Int) -> CKRecord.ID {
        let record = CKRecord(recordType: RecordType.bodySize.rawValue)
        let bodySizeId = CKRecord.ID(recordName: RecordType.bodySize.rawValue)
        let bodySize = BodySize(bodySizeId:bodySizeId, lingkarBadan: lingkarBadan, lingkarPinggang: lingkarPinggang, lebarDada: lebarDada)
        
        record.setValuesForKeys(bodySize.toDictionary())
        
        //saving record to db
        self.database.save(record) { newRecord, error in
            if let error = error {
                print(error)
            } else {
                if let newRecord = newRecord {
                    if let bodySize = BodySize.fromRecord(newRecord) {
                        DispatchQueue.main.async {
                            self.bodySizes.append(BodySizeItemViewModel(bodySize: bodySize))
                        }
                    }
                }
            }
        }
        return bodySizeId
    }
    
    func populateBodySize(){
        var bodySizes: [BodySize] = []
        
        let query = CKQuery(recordType: RecordType.bodySize.rawValue, predicate: NSPredicate(value: true))
        
        database.fetch(withQuery: query){ result in
            switch result {
                case .success(let result) :
                    result.matchResults.compactMap{$0.1}
                        .forEach{
                            switch $0 {
                                case .success(let record):
                                    if let bodySize = BodySize.fromRecord(record) {
                                        bodySizes.append(bodySize)
                                    }
                                case .failure(let error):
                                    print(error)
                            }
                        }
                    
                    DispatchQueue.main.async {
                        self.bodySizes = bodySizes.map(BodySizeItemViewModel.init)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
}

struct BodySizeItemViewModel {
    let bodySize: BodySize
    
    var bodySizeId: CKRecord.ID? {
        bodySize.bodySizeId
    }
    
    var lingkarBadan:Int {
        bodySize.lingkarBadan
    }
    
    var lingkarPinggang:Int {
        bodySize.lingkarPinggang
    }

    var lebarDada:Int{
        bodySize.lebarDada
    }
}
