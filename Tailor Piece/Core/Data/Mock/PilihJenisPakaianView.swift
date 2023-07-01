////
////  PilihJenisPakaianView.swift
////  Tailor Piece
////
////  Created by Salsabila Zahra Chinanti on 26/06/23.
////
//
//import Foundation
//import SwiftUI
//import CloudKit
//
//struct PilihJenisPakaianView:View {
//    
//    @State private var jenisPakaian:[String] = ["Atasan", "Bawahan"]
//    @State private var namaProyek = ""
//    @State private var jenisPakaianChosen = ""
//
//    var body: some View {
//        VStack {
//            Picker("Pilih Jenis Pakaian", selection: $jenisPakaianChosen) {
//                ForEach(jenisPakaian, id: \.self) { cloth in
//                    Text(cloth).tag(cloth)
//                }
//            }
//            
//            TextField("Nama proyek", text: $namaProyek)
//
//            NavigationLink("Next"){
////                MasukkanUkuranBadanView(namaProyek:namaProyek, jenisPakaian: jenisPakaianChosen)
//            }
//        }
//    }
//}
