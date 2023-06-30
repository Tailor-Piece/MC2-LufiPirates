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
    @Published var dictUkuranBadan: [String:Int] = [:]
    
    @Published var isLoading = false
    @Published var successAdd = false
    
    private let ukuranBadanRepository = UkuranBadanRepository()
    
    init(
        ukuranBadan: UkuranBadanModel?,
        dictUkuranBadan: [String:Int] = [:]
    ) {
        self.ukuranBadan = ukuranBadan
        self.dictUkuranBadan = [:]
    }
    
    func save() async {

        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        if let ukuranBadanNew = try? await ukuranBadanRepository.saveUkuranBadan(
            ukuranBadan : dictUkuranBadan,
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
    
}

extension UkuranBadanViewModel {
    
    func toDictionaryAtasan() -> [String:Int] {
        let dict : [String:Int] = [
            "Lingkar Badan" : dictUkuranBadan["lingkarBadan"]!,
            "Panjang Dada" : dictUkuranBadan["panjangDada"]!,
            "Lebar Dada" : dictUkuranBadan["lebarDada"]!,
            "Tinggi Dada" : dictUkuranBadan["tinggiDada"]!,
            "Panjang Punggung" : dictUkuranBadan["panjangPunggung"]!,
            "Lebar Punggung" : dictUkuranBadan["lebarPunggung"]!,
            "Lebar Bahu" : dictUkuranBadan["lebarBahu"]!,
            "Lingkar Pinggang" : dictUkuranBadan["lingkarPinggang"]!,
            "Lingkar Pinggul" : dictUkuranBadan["lingkarPinggul"]!
        ]
        return dict
    }
    
    func toDictionaryBawahan() -> [String:Int] {
        let dict : [String:Int] = [
            "Panjang Celana" : dictUkuranBadan["panjangCelana"]!,
            "Panjang Lutut" : dictUkuranBadan["panjangLutut"]!,
            "Lingkar Panggul" : dictUkuranBadan["lingkarPanggul"]!,
            "Lingkar Pesak" : dictUkuranBadan["lingkarPesak"]!,
            "1/2 Lingkar Paha" : dictUkuranBadan["setengahLingkarPaha"]!,
            "1/2 Lingkar Lutut" : dictUkuranBadan["setengahLingkarLutut"]!,
            "1/2 Lingkar Kaki" : dictUkuranBadan["setengahLingkarKaki"]!,
            "Lingkar Pinggang" : dictUkuranBadan["lingkarPinggang"]!,
            "Lingkar Pinggul" : dictUkuranBadan["lingkarPinggul"]!
        ]
        return dict
    }
}
