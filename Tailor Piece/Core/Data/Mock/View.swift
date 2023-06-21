//
//  View.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 21/06/23.
//

import Foundation
import SwiftUI

struct TestView: View {
    
    @StateObject private var vm : OrderListViewModel
    
    @State private var dateCreated: Date = Date()
    @State private var gender:String = ""
    @State private var bodySize:String = ""
    @State private var clothingType:String = ""
    @State private var patterns:String = ""
    
    init(vm: OrderListViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack{
            VStack{
                TextField("Enter gender", text: $gender)
                TextField("Enter bodySize", text: $bodySize)
                TextField("Enter clothingType", text: $clothingType)
                TextField("Enter patterns", text: $patterns)
                Button("Save"){
                    vm.saveOrder(dateCreated: dateCreated, gender: gender, bodySize: bodySize, clothingType: clothingType, patterns: patterns)
                }
            }
        
            Spacer()
            
            List {
                Text("\(vm.orders.count)")
                ForEach(vm.orders, id: \.orderId) { order in
                    HStack {
                        Text(order.bodySize)
                        Text(order.clothingType)
                        Text(order.gender)
                        Text(order.patterns)
                        Text("\(order.dateCreated)")
                    }
                }
            }
        }
        .onAppear(){
            vm.populateOrder()
        }
    }
}
