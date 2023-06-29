//
//  MasukkanUkuranBadanView.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 26/06/23.
//

import Foundation
import SwiftUI

struct MasukkanUkuranBadanView:View {
    
    @StateObject var ukuranBadanViewModel: UkuranBadanViewModel = UkuranBadanViewModel(ukuranBadan: nil)
    @State var namaProyek = ""
    var jenisPakaian:String
    
    @State private var lingkarBadan:Int = 0
    @State private var lingkarPinggang:Int = 0
    @State private var lingkarPinggul:Int = 0
    @State private var panjangDada:Int = 0
    @State private var lebarDada:Int = 0
    @State private var tinggiDada:Int = 0
    @State private var panjangPunggung:Int = 0
    @State private var lebarPunggung:Int = 0
    @State private var lebarBahu:Int = 0

    @State private var panjangCelana:Int = 0
    @State private var panjangLutut:Int = 0
    @State private var lingkarPanggul:Int = 0
    @State private var lingkarPesak:Int = 0
    @State private var setengahLingkarPaha:Int = 0
    @State private var setengahLingkarLutut:Int = 0
    @State private var setengahLingkarKaki:Int = 0
    
    @State private var nextPage = false
    
    func setDictionary() {
        self.ukuranBadanViewModel.dictUkuranBadan = [
            "lingkarBadan" : lingkarBadan,
            "panjangDada" : panjangDada,
            "lebarDada" : lebarDada,
            "tinggiDada" : tinggiDada,
            "panjangPunggung" : panjangPunggung,
            "lebarPunggung" : lebarPunggung,
            "lebarBahu" : lebarBahu,
            "lingkarPinggang" : lingkarPinggang,
            "lingkarPinggul" : lingkarPinggul,
            "panjangCelana" : panjangCelana,
            "panjangLutut" : panjangLutut,
            "lingkarPanggul" : lingkarPanggul,
            "lingkarPesak" : lingkarPesak,
            "setengahLingkarPaha" : setengahLingkarPaha,
            "setengahLingkarLutut" : setengahLingkarLutut,
            "setengahLingkarKaki" : setengahLingkarKaki,
        ]
    }
    
    var body: some View {
        VStack {
            TextField("Nama proyek", text: $namaProyek)
                .padding(.bottom, 20)
            
            Text("Masukkan Ukuran Badan")
            
            if(jenisPakaian == "Atasan"){
                
                TextField("Lingkar Badan", value: $lingkarBadan, formatter: NumberFormatter())
                
                TextField("Lingkar Pinggang", value: $lingkarPinggang, formatter: NumberFormatter())
                
                TextField("Lingkar Pinggul", value: $lingkarPinggul, formatter: NumberFormatter())
                
                TextField("Panjang Dada", value: $panjangDada, formatter: NumberFormatter())
                
                TextField("Lebar Dada", value: $lebarDada, formatter: NumberFormatter())
                
                TextField("Tinggi Dada", value: $tinggiDada, formatter: NumberFormatter())
                
                TextField("Panjang Punggung", value: $panjangPunggung, formatter: NumberFormatter())
                
                TextField("Lebar Punggung", value: $lebarPunggung, formatter: NumberFormatter())
                
                TextField("Lebar Bahu", value: $lebarBahu, formatter: NumberFormatter())
                
            } else {
                TextField("Panjang Celana", value: $panjangCelana, formatter: NumberFormatter())
                
                TextField("Panjang Lutut", value: $panjangLutut, formatter: NumberFormatter())
                
                TextField("Lingkar Pinggang", value: $lingkarPinggang, formatter: NumberFormatter())
                
                TextField("Lingkar Pinggul", value: $lingkarPinggul, formatter: NumberFormatter())
                
                TextField("Lingkar Panggul", value: $lingkarPanggul, formatter: NumberFormatter())
                
                TextField("Lingkar Pesak", value: $lingkarPesak, formatter: NumberFormatter())
                
                TextField("1/2 Lingkar Paha", value: $setengahLingkarPaha, formatter: NumberFormatter())
                
                TextField("1/2 Lingkar Lutut", value: $setengahLingkarLutut, formatter: NumberFormatter())
                
                TextField("1/2 Lingkar Kaki", value: $setengahLingkarKaki, formatter: NumberFormatter())
            }
        
            NavigationLink(destination: DesignView(ukuranBadanViewModel: ukuranBadanViewModel, namaProyek:namaProyek, jenisPakaian: jenisPakaian)) {
                Text("Next")
            }.simultaneousGesture(TapGesture().onEnded{
                setDictionary()
            })
        }
    }
}
