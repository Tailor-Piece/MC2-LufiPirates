//
//  MasukkanUkuranBadanView.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 26/06/23.
//

import Foundation
import SwiftUI

struct MasukkanUkuranBadanView:View {
    
//    @EnvironmentObject var proyekViewModel: ProyekViewModel
    @StateObject var ukuranBadanViewModel: UkuranBadanViewModel = UkuranBadanViewModel(ukuranBadan: nil)
    var jenisPakaian:String
    
    var body: some View {
        VStack {
            Text("Masukkan Ukuran Badan")
            
            if(jenisPakaian == "Atasan"){
                
                TextField("Lingkar Badan", value: $ukuranBadanViewModel.lingkarBadan, formatter: NumberFormatter())
                
                TextField("Lingkar Pinggang", value: $ukuranBadanViewModel.lingkarPinggang, formatter: NumberFormatter())
                
                TextField("Lingkar Pinggul", value: $ukuranBadanViewModel.lingkarPinggul, formatter: NumberFormatter())
                
                TextField("Panjang Dada", value: $ukuranBadanViewModel.panjangDada, formatter: NumberFormatter())
                
                TextField("Lebar Dada", value: $ukuranBadanViewModel.lebarDada, formatter: NumberFormatter())
                
                TextField("Tinggi Dada", value: $ukuranBadanViewModel.tinggiDada, formatter: NumberFormatter())
                
                TextField("Panjang Punggung", value: $ukuranBadanViewModel.panjangPunggung, formatter: NumberFormatter())
                
                TextField("Lebar Punggung", value: $ukuranBadanViewModel.lebarPunggung, formatter: NumberFormatter())
                
                TextField("Lebar Bahu", value: $ukuranBadanViewModel.lebarBahu, formatter: NumberFormatter())
                
            } else {
                TextField("Panjang Celana", value: $ukuranBadanViewModel.panjangCelana, formatter: NumberFormatter())
                
                TextField("Panjang Lutut", value: $ukuranBadanViewModel.panjangLutut, formatter: NumberFormatter())
                
                TextField("Lingkar Pinggang", value: $ukuranBadanViewModel.lingkarPinggang, formatter: NumberFormatter())
                
                TextField("Lingkar Pinggul", value: $ukuranBadanViewModel.lingkarPinggul, formatter: NumberFormatter())
                
                TextField("Lingkar Panggul", value: $ukuranBadanViewModel.lingkarPanggul, formatter: NumberFormatter())
                
                TextField("Lingkar Pesak", value: $ukuranBadanViewModel.lingkarPesak, formatter: NumberFormatter())
                
                TextField("1/2 Lingkar Paha", value: $ukuranBadanViewModel.SetengahLingkarPaha, formatter: NumberFormatter())
                
                TextField("1/2 Lingkar Lutut", value: $ukuranBadanViewModel.SetengahLingkarLutut, formatter: NumberFormatter())
                
                TextField("1/2 Lingkar Kaki", value: $ukuranBadanViewModel.SetengahLingkarKaki, formatter: NumberFormatter())
            }
            
            NavigationLink("Next"){
//                if let ukuranBadan = self.ukuranBadanViewModel.ukuranBadan {
//                    self.proyekViewModel.ukuranBadan = ukuranBadan
//                }
                DesignView(ukuranBadanViewModel: ukuranBadanViewModel, jenisPakaian: jenisPakaian)
//                    .environmentObject(proyekViewModel)
            }
        }
    }
}
