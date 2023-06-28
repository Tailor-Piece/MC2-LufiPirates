//
//  UkuranBadanViewModel.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 27/06/23.
//

import Foundation
import CloudKit

class UkuranBadanViewModel: ObservableObject {
    @Published var ukuranBadan: UkuranBadanModel?
    
    //for atasan
    @Published var lingkarBadan: Int = 0
    @Published var panjangDada: Int = 0
    @Published var lebarDada: Int = 0
    @Published var tinggiDada: Int = 0
    @Published var panjangPunggung: Int = 0
    @Published var lebarPunggung: Int = 0
    @Published var lebarBahu: Int = 0

    //for bawahan
    @Published var panjangCelana: Int = 0
    @Published var panjangLutut: Int = 0
    @Published var lingkarPanggul: Int = 0
    @Published var lingkarPesak: Int = 0
    @Published var SetengahLingkarPaha: Int = 0
    @Published var SetengahLingkarLutut: Int = 0
    @Published var SetengahLingkarKaki: Int = 0

    //for both
    @Published var lingkarPinggang: Int = 0
    @Published var lingkarPinggul: Int = 0
    
    @Published var isLoading = false
    @Published var successAdd = false
    
    private let ukuranBadanRepository = UkuranBadanRepository()
    
    init(
        ukuranBadan: UkuranBadanModel?,

        //for atasan
        lingkarBadan: Int = 0,
        panjangDada: Int = 0,
        lebarDada: Int = 0,
        tinggiDada: Int = 0,
        panjangPunggung: Int = 0,
        lebarPunggung: Int = 0,
        lebarBahu: Int = 0,

        //for bawahan
        panjangCelana: Int = 0,
        panjangLutut: Int = 0,
        lingkarPanggul: Int = 0,
        lingkarPesak: Int = 0,
        SetengahLingkarPaha: Int = 0,
        SetengahLingkarLutut: Int = 0,
        SetengahLingkarKaki: Int = 0,

        //for both
        lingkarPinggang: Int = 0,
        lingkarPinggul: Int = 0
    ) {
        self.ukuranBadan = ukuranBadan

        //for atasan
        self.lingkarBadan = 0
        self.panjangDada = 0
        self.lebarDada = 0
        self.tinggiDada = 0
        self.panjangPunggung = 0
        self.lebarPunggung = 0
        self.lebarBahu = 0

        //for bawahan
        self.panjangCelana = 0
        self.panjangLutut = 0
        self.lingkarPanggul = 0
        self.lingkarPesak = 0
        self.SetengahLingkarPaha = 0
        self.SetengahLingkarLutut = 0
        self.SetengahLingkarKaki = 0

        //for both
        self.lingkarPinggang = 0
        self.lingkarPinggul = 0
    }
    
    func save() async {

        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        if let ukuranBadanNew = try? await ukuranBadanRepository.saveUkuranBadan(
            lingkarBadan: lingkarBadan,
            panjangDada: panjangDada,
            lebarDada: lebarDada,
            tinggiDada: tinggiDada,
            panjangPunggung: panjangPunggung,
            lebarPunggung: lebarPunggung,
            lebarBahu: lebarBahu,
            panjangCelana: panjangCelana,
            panjangLutut: panjangLutut,
            lingkarPanggul: lingkarPanggul,
            lingkarPesak: lingkarPesak,
            SetengahLingkarPaha: SetengahLingkarPaha,
            SetengahLingkarLutut: SetengahLingkarLutut,
            SetengahLingkarKaki: SetengahLingkarKaki,
            lingkarPinggang: lingkarPinggang,
            lingkarPinggul: lingkarPinggul,
            
            completion: {
                
            results in
            switch results {
            case .success(_):
                DispatchQueue.main.async {
                    self.successAdd = true
                    self.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Error: \(error)")
                }
            }
        }) {
            DispatchQueue.main.async {
                self.ukuranBadan = ukuranBadanNew
                print("Success")
            }
        }

    }
    
//    func getAllBodySizes() async -> [BodySizeModel] {
//        DispatchQueue.main.async {
//            self.isLoading = true
//        }
//
//        if let bodySizes = try? await bodySizeRepository.getBodySizes(completion: {
//            results in
//                switch results {
//                case .success(_):
//                    DispatchQueue.main.async {
//                        self.isLoading = false
//                        print("Success")
//                    }
//                case .failure(let error):
//                    DispatchQueue.main.async {
//                        print("Error: \(error)")
//                        self.isLoading = false
//                    }
//                }
//        }){
//            DispatchQueue.main.async {
//                self.isLoading = false
//            }
//            return bodySizes
//        }
//        return []
//    }
    
}

extension UkuranBadanViewModel {
    func setModel(){
        if let ukuranBadan = ukuranBadan {
            ukuranBadan.lingkarBadan = lingkarBadan
            ukuranBadan.panjangDada = panjangDada
            ukuranBadan.lebarDada = lebarDada
            ukuranBadan.tinggiDada = tinggiDada
            ukuranBadan.panjangPunggung = panjangPunggung
            ukuranBadan.lebarPunggung = lebarPunggung
            ukuranBadan.lebarBahu = lebarBahu
            
            //for bawahan
            ukuranBadan.panjangCelana = panjangCelana
            ukuranBadan.panjangLutut = panjangLutut
            ukuranBadan.lingkarPanggul = lingkarPanggul
            ukuranBadan.lingkarPesak = lingkarPesak
            ukuranBadan.SetengahLingkarPaha = SetengahLingkarPaha
            ukuranBadan.SetengahLingkarLutut = SetengahLingkarLutut
            ukuranBadan.SetengahLingkarKaki = SetengahLingkarKaki
            
            //for both
            ukuranBadan.lingkarPinggang = lingkarPinggang
            ukuranBadan.lingkarPinggul = lingkarPinggul
        }
    }
    
    func toDictionary() -> [String:Int] {
        let dict : [String:Int] = [
            "lingkarBadan" : lingkarBadan,
            "panjangDada" : panjangDada,
            "lebarDada" : lebarDada,
            "tinggiDada" : tinggiDada,
            "panjangPunggung" : panjangPunggung,
            "lebarPunggung" : lebarPunggung,
            "lebarBahu" : lebarBahu,
            "panjangCelana" : panjangCelana,
            "panjangLutut" : panjangLutut,
            "lingarPanggul" : lingkarPanggul,
            "lingarPesak" : lingkarPesak,
            "setengahLingkarPaha" : SetengahLingkarPaha,
            "setengahLingkarLutut" : SetengahLingkarLutut,
            "setengahLingkarKaki" : SetengahLingkarKaki,
            "lingkarPinggang" : lingkarPinggang,
            "lingkarPinggul" : lingkarPinggul
        ]
        return dict.filter { $0.value != 0 }
    }
}
