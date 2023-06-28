//
//  PilihJenisPakaianView.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 26/06/23.
//

import Foundation
import SwiftUI
import CloudKit

struct PilihJenisPakaianView:View {
    
//    @EnvironmentObject var proyekViewModel: ProyekViewModel
//    @StateObject var pilihJenisPakaianViewModel = PilihJenisPakaianViewModel()
//    @StateObject var proyekViewModel = ProyekViewModel(proyek: nil)
    @State private var jenisPakaian:[String] = ["Atasan", "Bawahan"]
    @State private var jenisPakaianChosen = ""

    var body: some View {
        VStack {
            Picker("Pilih Jenis Pakaian", selection: $jenisPakaianChosen) {
                Text("Pilih jenis pakaian").tag("")
                ForEach(jenisPakaian, id: \.self) { cloth in
                    Text(cloth)
                }
            }

            NavigationLink("Next"){
                MasukkanUkuranBadanView(jenisPakaian: jenisPakaianChosen)
//                    .environmentObject(proyekViewModel)
            }
        }
    }
}
