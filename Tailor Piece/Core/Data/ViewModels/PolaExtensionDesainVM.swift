//
//  PolaExtensionDesainVM.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 28/06/23.
//

import Foundation

//MARK: GET UKURAN POLA
extension DesainViewModel {
    
    func getPolaBentukPakaian(ukuranBadan:[String:Int], tipeDesain:String) -> [String:[String:Int]] {
        if tipeDesain == "Classic Fit"{
            return calculateClassicFit(ukuranBadan: ukuranBadan)
        } else if tipeDesain == "Modern Fit" {
            return calculateModernFit(ukuranBadan: ukuranBadan)
        } else {
            return calculateSlimFit(ukuranBadan: ukuranBadan)
        }
    }
    
    func getPolaLengan(ukuranBadan:[String:Int], tipeDesain:String) -> [String:[String:Int]] {
        if tipeDesain == "Long Sleeves"{
            return calculateLongSleeves(ukuranBadan: ukuranBadan)
        } else if tipeDesain  == "3/4 Sleeves" {
            return calculateThreeQuartersSleeves(ukuranBadan: ukuranBadan)
        } else {
            return calculateShortSleeves(ukuranBadan: ukuranBadan)
        }
    }
    
    func getPolaLeher(ukuranBadan:[String:Int], tipeDesain:String) -> [String:[String:Int]] {
        if tipeDesain  == "Short Collar"{
            return calculateShortCollar(ukuranBadan: ukuranBadan)
        } else if tipeDesain  == "Cut Away Collar" {
            return calculateCutAwayCollar(ukuranBadan: ukuranBadan)
        } else {
            return calculateClassicCollar(ukuranBadan: ukuranBadan)
        }
    }
    
    func getPolaCelana(ukuranBadan:[String:Int], tipeDesain:String) -> [String:[String:Int]] {
        if tipeDesain  == "celana 1"{
            return calculateCelana1(ukuranBadan: ukuranBadan)
        } else if tipeDesain  == "celana 2" {
            return calculateCelana2(ukuranBadan: ukuranBadan)
        } else {
            return calculateCelana3(ukuranBadan: ukuranBadan)
        }
    }
}

//MARK: CALCULATION
extension DesainViewModel {
    
    func calculateClassicFit(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":1, "BC":2]
        var pola2 = ["AB":3, "CD":4]
        
        //MARK: CALCULATION
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateModernFit(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":5, "BC":6]
        var pola2 = ["AB":7, "CD":8]
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateSlimFit(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":9, "BC":10]
        var pola2 = ["AB":11, "CD":12]
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateLongSleeves(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":13, "BC":14]
        var pola2 = ["AB":15, "CD":16]
                
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateThreeQuartersSleeves(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":17, "BC":18]
        var pola2 = ["AB":19, "CD":20]
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateShortSleeves(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":21, "BC":22]
        var pola2 = ["AB":23, "CD":24]
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateShortCollar(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":25, "BC":26]
        var pola2 = ["AB":27, "CD":28]
                
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateCutAwayCollar(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":29, "BC":30]
        var pola2 = ["AB":31, "CD":32]
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateClassicCollar(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":33, "BC":34]
        var pola2 = ["AB":35, "CD":36]
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateCelana1(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":37, "BC":38]
        var pola2 = ["AB":39, "CD":40]
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateCelana2(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":41, "BC":42]
        var pola2 = ["AB":43, "CD":44]
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateCelana3(ukuranBadan:[String:Int]) -> [String:[String:Int]] {
        var pola1 = ["AB":45, "BC":46]
        var pola2 = ["AB":47, "CD":48]
        return ["pola1":pola1, "pola2":pola2]
    }
}
