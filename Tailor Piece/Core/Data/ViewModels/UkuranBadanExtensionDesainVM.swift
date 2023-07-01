//
//  UkuranBadanExtensionDesainVM.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 01/07/23.
//

import Foundation

extension DesainViewModel {
    
    func toDictionary() -> [String:Double?] {
        var dict : [String:Double?] = [:]
        if(jenisPakaian == "Atasan"){
            dict = [
                "Lingkar Badan" : dictUkuranBadan["Lingkar Badan"]!,
                "Panjang Dada" : dictUkuranBadan["Panjang Dada"]!,
                "Lebar Dada" : dictUkuranBadan["Lebar Dada"]!,
                "Tinggi Dada" : dictUkuranBadan["Tinggi Dada"]!,
                "Panjang Punggung" : dictUkuranBadan["Panjang Punggung"]!,
                "Lebar Punggung" : dictUkuranBadan["Lebar Punggung"]!,
                "Lebar Bahu" : dictUkuranBadan["Lebar Bahu"]!,
                "Lingkar Pinggang" : dictUkuranBadan["Lingkar Pinggang"]!,
                "Lingkar Pinggul" : dictUkuranBadan["Lingkar Pinggul"]!
            ]
        }
        else {
            dict = [
                "Panjang Celana" : dictUkuranBadan["Panjang Celana"]!,
                "Panjang Lutut" : dictUkuranBadan["Panjang Lutut"]!,
                "Lingkar Panggul" : dictUkuranBadan["Lingkar Panggul"]!,
                "Lingkar Pesak" : dictUkuranBadan["Lingkar Pesak"]!,
                "1/2 Lingkar Paha" : dictUkuranBadan["1/2 Lingkar Paha"]!,
                "1/2 Lingkar Lutut" : dictUkuranBadan["1/2 Lingkar Lutut"]!,
                "1/2 Lingkar Kaki" : dictUkuranBadan["1/2 Lingkar Kaki"]!,
                "Lingkar Pinggang" : dictUkuranBadan["Lingkar Pinggang"]!,
                "Lingkar Pinggul" : dictUkuranBadan["Lingkar Pinggul"]!
            ]
        }
        return dict
    }
}
