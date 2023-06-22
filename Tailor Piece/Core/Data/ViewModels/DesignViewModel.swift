//
//  DesignViewModel.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 21/06/23.
//

import Foundation
import CloudKit


class DesignViewModel : ObservableObject {
    private var database: CKDatabase
    private var container: CKContainer
    
    @Published var designs: [DesignItemViewModel] = []
    
    init(container: CKContainer){
        self.container = container
        self.database = self.container.publicCloudDatabase
    }
    
    func saveDesign(dateCreated: Date, gender: Gender, bodySize:CKRecord.ID, clothingType:ClothingType, patterns:String){
        let record = CKRecord(recordType: RecordType.design.rawValue)
        let designId = CKRecord.ID(recordName: RecordType.design.rawValue)
        let design = Design(designId: designId, dateCreated:dateCreated, gender:gender, bodySize:bodySize, clothingType:clothingType, patterns:patterns)
        
        record.setValuesForKeys(design.toDictionary())
        
        //saving record to db
        self.database.save(record) { newRecord, error in
            if let error = error {
                print("sini")
                print(error)
            } else {
                print("masuksini")
                if let newRecord = newRecord {
                    if let design = Design.fromRecord(newRecord) {
                        DispatchQueue.main.async {
                            self.designs.append(DesignItemViewModel(design: design))
                        }
                    }
                }
            }
        }
    }
    
    func populateDesign(){
        var designs: [Design] = []
        
        let query = CKQuery(recordType: RecordType.design.rawValue, predicate: NSPredicate(value: true))
        
        database.fetch(withQuery: query){ result in
            switch result {
                case .success(let result) :
                    result.matchResults.compactMap{$0.1}
                        .forEach{
                            switch $0 {
                                case .success(let record):
                                    if let design = Design.fromRecord(record) {
                                        designs.append(design)
                                    }
                                case .failure(let error):
                                    print(error)
                            }
                        }
                    
                    DispatchQueue.main.async {
                        self.designs = designs.map(DesignItemViewModel.init)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
}

struct DesignItemViewModel {
    let design: Design
    
    var designId: CKRecord.ID? {
        design.designId
    }
    
    var dateCreated:Date {
        design.dateCreated
    }

    var gender:Gender{
        design.gender
    }

    var bodySize:CKRecord.ID{
        design.bodySize
    }

    var clothingType:ClothingType{
        design.clothingType
    }

    var patterns:String {
        design.patterns
    }
}
