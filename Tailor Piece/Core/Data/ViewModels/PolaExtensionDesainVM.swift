//
//  PolaExtensionDesainVM.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 28/06/23.
//

import Foundation

//MARK: GET UKURAN POLA
extension DesainViewModel {
    
    func setPola(ukuranBadan:[String:Double?]){
        if(jenisPakaian == "Atasan") {
            self.polaBentukPakaian = getPolaBentukPakaian(ukuranBadan: ukuranBadan, tipeDesain: tipeDesainChosen["Bentuk Pakaian"]!)
            self.polaLengan = getPolaLengan(ukuranBadan: ukuranBadan, tipeDesain: tipeDesainChosen["Lengan"]!)
            self.polaLeher = getPolaBentukPakaian(ukuranBadan: ukuranBadan, tipeDesain: tipeDesainChosen["Leher"]!)
        } else {
            self.polaCelana = getPolaBentukPakaian(ukuranBadan: ukuranBadan, tipeDesain: tipeDesainChosen["Celana"]!)
        }
    }
    
    func getPolaBentukPakaian(ukuranBadan:[String:Double?], tipeDesain:String) -> [String:[String:Double]] {
        if tipeDesain == "Classic Fit"{
            return calculateClassicFit(ukuranBadan: ukuranBadan)
        } else if tipeDesain == "Modern Fit" {
            return calculateModernFit(ukuranBadan: ukuranBadan)
        } else {
            return calculateSlimFit(ukuranBadan: ukuranBadan)
        }
    }
    
    func getPolaLengan(ukuranBadan:[String:Double?], tipeDesain:String) -> [String:[String:Double]] {
        if tipeDesain == "Long Sleeves"{
            return calculateLongSleeves(ukuranBadan: ukuranBadan)
        } else if tipeDesain  == "3/4 Sleeves" {
            return calculateThreeQuartersSleeves(ukuranBadan: ukuranBadan)
        } else {
            return calculateShortSleeves(ukuranBadan: ukuranBadan)
        }
    }
    
    func getPolaLeher(ukuranBadan:[String:Double?], tipeDesain:String) -> [String:[String:Double]] {
        if tipeDesain  == "Short Collar"{
            return calculateShortCollar(ukuranBadan: ukuranBadan)
        } else if tipeDesain  == "Cut Away Collar" {
            return calculateCutAwayCollar(ukuranBadan: ukuranBadan)
        } else {
            return calculateClassicCollar(ukuranBadan: ukuranBadan)
        }
    }
    
    func getPolaCelana(ukuranBadan:[String:Double?], tipeDesain:String) -> [String:[String:Double]] {
        if tipeDesain  == "celana 1"{
            return calculateLoosePants(ukuranBadan: ukuranBadan)
        } else if tipeDesain  == "celana 2" {
            return calculateRelaxedPants(ukuranBadan: ukuranBadan)
        } else {
            return calculateStandardPants(ukuranBadan: ukuranBadan)
        }
    }
}

//MARK: CALCULATION
extension DesainViewModel {
    
    func calculateClassicFit(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
        
        //MARK: CALCULATION
        return ["Pola_CF_Depan":pola1, "Pola_CF_Belakang":pola2]
    }
    
    func calculateModernFit(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
        return ["Pola_MF_Depan":pola1, "Pola_MF_Belakang":pola2]
    }
    
    func calculateSlimFit(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
        return ["Pola_SF_Depan":pola1, "Pola_SF_Belakang":pola2]
    }
    
    func calculateLongSleeves(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
                
        return ["Pola_LS":pola1]
    }
    
    func calculateThreeQuartersSleeves(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
        return ["Pola_3-4S":pola1]
    }
    
    func calculateShortSleeves(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
        return ["Pola_SS":pola1]
    }
    
    func calculateShortCollar(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
                
        return ["Pola_SC":pola1]
    }
    
    func calculateCutAwayCollar(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
        return ["Pola_CAC":pola1]
    }
    
    func calculateClassicCollar(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
        return ["Pola_CC":pola1]
    }
    
//    "Celana": ["Loose Pants", "Relaxed Pants", "Standard Pants"]
    
    func calculateLoosePants(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
        return ["Pola_CLF_Belt":pola1, "Pola_CLF_Kanan":pola2]
    }
    
    func calculateRelaxedPants(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
        return ["Pola_CRF_Belt":pola1, "Pola_CLF_Kanan":pola2]
    }
    
    func calculateStandardPants(ukuranBadan:[String:Double?]) -> [String:[String:Double]] {
        var pola1:[String:Double] = ["AB":1, "BC":2]
        var pola2:[String:Double] = ["AB":3, "CD":4]
        return ["Pola_CSF_Belt":pola1, "Pola_CSF_Kanan":pola2]
    }
}
