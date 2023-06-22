//
//  View.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 21/06/23.
//

import Foundation
import SwiftUI
import CloudKit

struct TestView: View {
    
    @StateObject private var vmDesign : DesignViewModel
    @StateObject private var vmBodySize : BodySizeViewModel
    
    @State private var dateCreated: Date = Date()
    @State private var gender:Gender = Gender.man
    @State private var clothingType:ClothingType = ClothingType.rok
    @State private var patterns:String = ""
    @State private var lingkarbadan:Int = 0
    @State private var lingkarpinggang:Int = 0
    @State private var lebardada:Int = 0
    
    private var bodySize: BodySize {
        return BodySize(lingkarBadan: lingkarbadan, lingkarPinggang: lingkarpinggang, lebarDada: lebardada)
    }
    
    init(vmDesign: DesignViewModel, vmBodySize: BodySizeViewModel) {
        _vmDesign = StateObject(wrappedValue: vmDesign)
        _vmBodySize = StateObject(wrappedValue: vmBodySize)
    }
    
    var body: some View {
        VStack{
            VStack{
                
                //gender
                VStack {
                    Picker("Please choose a gender", selection: $gender) {
                        ForEach(Gender.allCases, id: \.self) { gender in
                            Text(gender.rawValue)
                        }
                    }
                    Text("You selected: \(gender.rawValue)")
                }
                
                //clothing type
                VStack {
                    Picker("Please choose clothing type", selection: $clothingType) {
                        if(gender.rawValue == "Man"){
                            ForEach(ClothingType.getManClothing(), id: \.self) { cloth in
                                Text(cloth.rawValue)
                            }
                        } else {
                            ForEach(ClothingType.getWomanClothing(), id: \.self) { cloth in
                                Text(cloth.rawValue)
                            }
                        }
                    }
                    Text("You selected: \(clothingType.rawValue)")
                }
                
                //body size
                Text("Body Size")
                TextField("Lingkar Badan", value: $lingkarbadan, formatter: NumberFormatter())
                TextField("Lingkar Pinggang", value: $lingkarpinggang, formatter: NumberFormatter())
                TextField("Lebar Dada", value: $lebardada, formatter: NumberFormatter())

                //patterns
                TextField("Enter patterns", text: $patterns)
                Button("Save"){
                    let bodySizeId : CKRecord.ID =  vmBodySize.saveBodySize(lingkarBadan: lingkarbadan, lingkarPinggang: lingkarpinggang, lebarDada: lebardada)
                    let bodySizeReference = CKRecord.Reference(recordID: bodySizeId, action: .none)
                    vmDesign.saveDesign(
                        dateCreated: dateCreated,
                        gender: gender,
                        bodySize: bodySizeReference,
                        clothingType: clothingType,
                        patterns: patterns)
                }
            }
        
            Spacer()
            
            List {
                Text("\(vmDesign.designs.count)")
                ForEach(vmDesign.designs, id: \.designId) { design in
                    HStack {
                        Text("\(design.bodySize.recordName)")
//                        Text("\(design.bodySize.lebarDada)")
//                        Text("\(design.bodySize.lingkarBadan)")
//                        Text("\(design.bodySize.lingkarPinggang)")
                        Text(design.clothingType.rawValue)
                        Text(design.gender.rawValue)
                        Text(design.patterns)
                        Text("\(design.dateCreated)")
                    }
                }
            }
        }
        .onAppear(){
            vmDesign.populateDesign()
        }
    }
}
