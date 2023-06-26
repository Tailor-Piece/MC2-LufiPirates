//
//  OrderListViewModel.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 21/06/23.
//

import Foundation
import CloudKit

enum RecordType:String{
    case order = "Order"
}

class OrderListViewModel : ObservableObject {
    private var database: CKDatabase
    private var container: CKContainer
    
    @Published var orders: [OrderViewModel] = []
    
    init(container: CKContainer){
        self.container = container
        self.database = self.container.publicCloudDatabase
    }
    
    func saveOrder(dateCreated: Date, gender: String, bodySize:String, clothingType:String, patterns:String){
        let record = CKRecord(recordType: RecordType.order.rawValue)
        let order = Order(dateCreated:dateCreated, gender:gender, bodySize:bodySize, clothingType:clothingType, patterns:patterns)
        record.setValuesForKeys(order.toDictionary())
        
        //saving record to db
        self.database.save(record) { newRecord, error in
            if let error = error {
                print(error)
            } else {
                if let newRecord = newRecord {
                    if let order = Order.fromRecord(newRecord) {
                        DispatchQueue.main.async {
                            self.orders.append(OrderViewModel(order: order))
                        }
                    }
                }
            }
        }
    }
    
    func populateOrder(){
        var orders: [Order] = []
        
        let query = CKQuery(recordType: RecordType.order.rawValue, predicate: NSPredicate(value: true))
        
        database.fetch(withQuery: query){ result in
            switch result {
            case .success(let result) :
                result.matchResults.compactMap{$0.1}
                    .forEach{
                        switch $0 {
                            case .success(let record):
                                if let order = Order.fromRecord(record) {
                                    orders.append(order)
                                }
                            case .failure(let error):
                                print(error)
                        }
                    }
                
                DispatchQueue.main.async {
                    self.orders = orders.map(OrderViewModel.init)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct OrderViewModel {
    let order: Order
    
    var orderId: CKRecord.ID? {
        order.orderID
    }
    
    var dateCreated:Date {
        order.dateCreated
    }

    var gender:String{
        order.gender
    }

    var bodySize:String{
        order.bodySize
    }

    var clothingType:String{
        order.clothingType
    }

    var patterns:String {
        order.patterns
    }
}
