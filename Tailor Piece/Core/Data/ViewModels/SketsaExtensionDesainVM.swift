//
//  SketsaExtensionDesainVM.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 28/06/23.
//

import Foundation

extension DesainViewModel {
    
    func getSketsaAtasan(bentukPakaian:String, lengan:String, leher:String) -> [String] {
        if(bentukPakaian == "Classic Fit") {
            if(lengan == "Long Sleeves") {
                if(leher == "Short Collar") {
                    setSketsa(tampakDepan: "depan", tampakBelakang: "belakang")
                } else if(leher == "Cut Away Collar"){
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                }
            } else if(lengan == "3/4 Sleeves"){
                if(leher == "Short Collar") {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else if(leher == "Cut Away Collar"){
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                }
            } else {
                if(leher == "Short Collar") {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else if(leher == "Cut Away Collar"){
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                }
            }
        }
        
        else if(bentukPakaian == "Modern Fit") {
            if(lengan == "Long Sleeves") {
                if(leher == "Short Collar") {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else if(leher == "Cut Away Collar"){
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                }
            } else if(lengan == "3/4 Sleeves"){
                if(leher == "Short Collar") {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else if(leher == "Cut Away Collar"){
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                }
            } else {
                if(leher == "Short Collar") {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else if(leher == "Cut Away Collar"){
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                }
            }
        }
        
        else {
            if(lengan == "Long Sleeves") {
                if(leher == "Short Collar") {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else if(leher == "Cut Away Collar"){
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                }
            } else if(lengan == "3/4 Sleeves"){
                if(leher == "Short Collar") {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else if(leher == "Cut Away Collar"){
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                }
            } else {
                if(leher == "Short Collar") {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else if(leher == "Cut Away Collar"){
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                } else {
                    setSketsa(tampakDepan: "", tampakBelakang: "")
                }
            }
        }
        return [self.tampakSketsa["sketsaTampakDepan"]!, self.tampakSketsa["sketsaTampakBelakang"]!]
    }
    
    func getSketsaBawahan(celana:String) -> [String] {
        if(celana == "1"){
            setSketsa(tampakDepan: "", tampakBelakang: "")
        } else if(celana == "2"){
            setSketsa(tampakDepan: "", tampakBelakang: "")
        } else {
            setSketsa(tampakDepan: "", tampakBelakang: "")
        }
        return [self.tampakSketsa["sketsaTampakDepan"]!, self.tampakSketsa["sketsaTampakBelakang"]!]
    }
    
    func setSketsa(tampakDepan:String, tampakBelakang:String){
        self.tampakSketsa["sketsaTampakDepan"] = tampakDepan
        self.tampakSketsa["sketsaTampakBelakang"] = tampakBelakang
    }
    
}
