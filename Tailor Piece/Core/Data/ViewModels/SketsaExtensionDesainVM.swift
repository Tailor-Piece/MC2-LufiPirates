//
//  SketsaExtensionDesainVM.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 28/06/23.
//

import Foundation

extension DesainViewModel {
    
    func getSketsaAtasan(bentukPakaian:String, lengan:String, leher:String) -> [String] {
        var finalString = ""
        if bentukPakaian == "Classic Fit" {
            finalString += "CF"
        } else if bentukPakaian == "Modern Fit" {
            finalString += "MF"
        } else {
            finalString += "SF"
        }
        
        finalString += "_"
        
        if lengan == "Long Sleeves" {
            finalString += "LS"
        } else if lengan == "3/4 Sleeves" {
            finalString += "3-4S"
        } else {
            finalString += "SS"
        }
        
        finalString += "_"
        
        if leher == "Short Collar" {
            finalString += "SC"
        } else if leher == "Cut-Away Collar" {
            finalString += "CAC"
        } else {
            finalString += "CC"
        }
        
        
        setSketsa(tampakDepan: "\(finalString)_Depan", tampakBelakang: "\(finalString)_Belakang")
       return [self.tampakSketsa["sketsaTampakDepan"]!, self.tampakSketsa["sketsaTampakBelakang"]!]
    }
    
    func getSketsaBawahan(celana:String) -> [String] {
        var finalString = ""
        if celana == "Loose Pants" {
            finalString += "LP"
        } else if celana == "Relaxed Pants" {
            finalString += "RP"
        } else {
            finalString += "SP"
        }
        setSketsa(tampakDepan: "\(finalString)_Depan", tampakBelakang: "\(finalString)_Belakang")
        return [self.tampakSketsa["sketsaTampakDepan"]!, self.tampakSketsa["sketsaTampakBelakang"]!]
    }
    
    func setSketsa(tampakDepan:String, tampakBelakang:String){
        self.tampakSketsa["sketsaTampakDepan"] = tampakDepan
        self.tampakSketsa["sketsaTampakBelakang"] = tampakBelakang
    }
    
}
