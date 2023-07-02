//
//  PolaExtensionDesainVM.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 28/06/23.
//

import Foundation

//MARK: GET UKURAN POLA
extension DesainViewModel {
    
    func getPolaBentukPakaian(ukuranBadan:[String:Double], tipeDesain:String) -> [String:[String:Double]?] {
        let clothesSize = calculateClothesSize(ukuranBadan: ukuranBadan)
        
        var assetStr = ""
        if tipeDesain == "Classic Fit" {
            assetStr = "CF"
        } else if tipeDesain == "Modern Fit" {
            assetStr = "MF"
        } else {
            assetStr = "Slim Fit"
        }
        
        return ["Pola_Bahu": clothesSize["shoulderPart"],
                "Pola_\(assetStr)_Depan": clothesSize["collarPartOnClothes"],
                "Pola_\(assetStr)_Belakang": clothesSize["bodyPart"]]
    }
    
    func getPolaLengan(ukuranBadan:[String:Double], tipeDesain:String) -> [String:[String:Double]] {
        
        var assetStr = ""
        if tipeDesain == "Long Sleeves" {
            assetStr = "LS"
        } else if tipeDesain == "3/4 Sleeves" {
            assetStr = "3-4S"
        } else {
            assetStr = "SS"
        }
        
        var shortSleeves = calculateShortSleeves(ukuranBadan: ukuranBadan)
        if (tipeDesain == "Long Sleeves") {
            var longSleeves1 = calculateLongSleevesOnlyPartOne(ukuranBadan: ukuranBadan)
            var longSleeves2 = calculateLongSleevesOnlyPartTwo(ukuranBadan: ukuranBadan)
            var longSleeves3 = calculateLongSleevesOnlyPartThree(ukuranBadan: ukuranBadan)
            return ["Pola_\(assetStr)1":longSleeves1, "Pola_\(assetStr)2":longSleeves2, "Pola_\(assetStr)3":longSleeves3, "Pola_\(assetStr)4":shortSleeves]
        }
        else{
            return ["Pola_\(assetStr)":shortSleeves]
        }
    }
    
    func getPolaLeher(ukuranBadan:[String:Double], tipeDesain:String) -> [String:[String:Double]] {
        
//        "Short Collar", "Cut-Away Collar", "Classic Collar"]
        
        var assetStr = ""
        if tipeDesain == "Short Collar" {
            assetStr = "SC"
        } else if tipeDesain == "Cut-Away Collar" {
            assetStr = "CAC"
        } else {
            assetStr = "CC"
        }
        
        var collarSize = calculateCollarSize(ukuranBadan: ukuranBadan)
        return ["Pola_\(assetStr)": collarSize]
    }
    
    func getPolaCelana(ukuranBadan:[String:Double], tipeDesain:String) -> [String:[String:Double]] {
                
        var assetStr = ""
        if tipeDesain == "Loose Pants" {
            assetStr = "CLF"
        } else if tipeDesain == "Relaxed Pants" {
            assetStr = "CRF"
        } else {
            assetStr = "CSF"
        }
        
        let pola2 = calculatePantsAllSize(ukuranBadan: ukuranBadan)
        var pola1: [String:Double]
        var pola3: [String:Double]
        if tipeDesain  == "Relaxed Fit"{
            pola1 = calculatePantsRelaxedFitPartOne(ukuranBadan: ukuranBadan)
            pola3 = calculatePantsRelaxedFitPartTwo(ukuranBadan: ukuranBadan)
        } else {
            pola1 = calculatePantsStandardLooseFitPartOne(ukuranBadan: ukuranBadan)
            pola3 = calculatePantsStandardLooseFitPartTwo(ukuranBadan: ukuranBadan)
        }
        return ["Pola_\(assetStr)_Belt": pola1, "Pola_\(assetStr)_Kanan": pola2, "Pola_\(assetStr)_Kiri": pola3]
    }
}

//MARK: CALCULATION
extension DesainViewModel {
    
    func calculateClothesSize(ukuranBadan:[String:Double]) -> [String:[String:Double]] {
        var bodyPart = calculateBodyPart(ukuranBadan: ukuranBadan)
        var shoulderPart = calculateShoulderPart(ukuranBadan: ukuranBadan)
        var collarPartOnClothes = calculateCollarPartOnClothes(ukuranBadan: ukuranBadan)
        
        //MARK: CALCULATION
        return ["bodyPart":bodyPart, "shoulderPart":shoulderPart, "collarPartOnClothes": collarPartOnClothes]
    }
    // Tipe pola bentuk pakaian
    func calculateBodyPart(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = Double(((ukuranBadan["Lingkar Badan"]!) + 5) / 2)
        let CD: Double = AB
        let AC: Double = Double((ukuranBadan["Lingkar Badan"]!))
        let BD: Double = AC
        let HB: Double = ((1/10) * AB) + 3
        let AG: Double = HB
        let BF: Double = AG - 1
        let AE: Double = BF
        let FD: Double = AC - AE
        let EC: Double = FD
        let GH = AB - AG - HB
        
        let result = ["AB":AB, "CD":CD, "AC":AC, "BD":BD, "HB":HB, "AG":AG, "BF":BF, "AE":AE, "FD":FD, "EC":EC, "GH":GH]
        return result
    }
    func calculateShoulderPart(ukuranBadan:[String:Double]) -> [String:Double]  {
        let AB: Double = Double((ukuranBadan["Lebar Dada"]!) / 2)
        let IJ: Double = AB
        let EB: Double = ((1/10) * (((ukuranBadan["Lingkar Badan"]!) + 5) / 2)) + 3
        let BF: Double = EB - 1
        let CD: Double = 4.0
        let DE: Double = Double((ukuranBadan["Lebar Bahu"]!))
        let CE: Double = sqrt((DE*DE) - (CD*CD))
        let GH: Double = AB - EB - CE
        let AG: Double = ((1/2) * (ukuranBadan["Lebar Dada"]!)) - 1
        
        let result = ["AB":AB, "IJ":IJ, "EB":EB, "BF":BF, "CD":CD, "DE":DE, "CE":CE, "GH":GH, "AG":AG]
        return result
    }
    func calculateCollarPartOnClothes(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = Double(((ukuranBadan["Lingkar Badan"]!) + 5) / 2)
        let CD: Double = AB
        let BD: Double = Double((( 1/2 * (ukuranBadan["Panjang Punggung"]!)) - 1) / 2)
        let AC: Double = BD
        let AF: Double = 2.0
        let GH: Double = Double((ukuranBadan["Lebar Bahu"]!))
        let EF: Double = GH
        let IJ: Double = AC - AF
        
        let result = ["AB":AB, "CD":CD, "BD":BD, "AC":AC, "AF":AF, "GH":GH, "EF":EF, "IJ":IJ]
        return result
    }
    
    // Tipe Pola Leher
    func calculateCollarSize(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB1: Double = Double( 1/2 * ((ukuranBadan["Lingkar Badan"]!) + 5 ))
        let CD1: Double = AB1
        let BD1: Double = 6.0
        let AC1: Double = BD1
        let AB2: Double = Double((1/2 * ((ukuranBadan["Lingkar Badan"]!) + 5 )) + 3)
        let CD2: Double = AB2
        let BD2: Double = 3.0
        let AC2: Double = BD2
        
        let result = ["AB1":AB1, "CD1":CD1, "BD1":BD1, "AC1":AC1, "AB2":AB2, "CD2":CD2, "BD2":BD2, "AC2":AC2]
        return result
    }
    
    // Tipe pola Lengan
    func calculateShortSleeves(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = (ukuranBadan["Lingkar Pangkal Lengan"]!)
        let AC: Double = (1/2 * (ukuranBadan["Lingkar Pangkal Lengan"]!)) - 0.5
        let CB: Double = AC
        let CD: Double = (ukuranBadan["Panjang Lengan"]!)
        let EF: Double = (ukuranBadan["Lingkar Lengan Bawah"]!)
        
        var result = ["AB":AB, "AC":AC, "CB":CB, "CD":CD, "EF": EF]
        return result
    }
    
    func calculateLongSleevesOnlyPartOne(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = (ukuranBadan["Lingkar Lengan Bawah"]!)
        let CD: Double = AB
        let BD: Double = 8.0
        let AC: Double = BD
        
        var result = ["AB":AB, "CD":CD, "BD":BD, "AC":AC]
        return result
    }
    
    func calculateLongSleevesOnlyPartTwo(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = 2.5
        let CD: Double = AB
        let BD: Double = 6.0
        let AC: Double = BD
        
        var result = ["AB":AB, "CD":CD, "BD":BD, "AC":AC]
        return result
    }
    
    func calculateLongSleevesOnlyPartThree(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = 4.0
        let CD: Double = AB
        let BD: Double = 5.0
        let AC: Double = BD
        let EF: Double = 2.0
        let EG: Double = EF
        
        var result = ["AB":AB, "CD":CD, "BD":BD, "AC":AC, "EF":EF, "EG":EG]
        return result
    }
   
    // Tipe pola pants
    func calculatePantsAllSize(ukuranBadan:[String:Double]) -> [String:Double] {
        let AC: Double = (ukuranBadan["Panjang Celana"]!) + 10
        let BD: Double = AC
        let EF: Double = (ukuranBadan["Lingkar Pinggang"]!) / 4
        let BF: Double = 3.0
        let EB: Double = sqrt((EF * EF) - (BF - BF))
        let AB: Double = (ukuranBadan["Lingkar Pinggang"]!) - 4
        let AE: Double = AB - EB
        let AG: Double = 1/3 * AC
        let HI: Double = ukuranBadan["1/2 Lingkar Kaki"]!
       
       
        var result = ["AC":AC, "BD":BD, "EF":EF, "BF":BF, "EB":EB,"AB":AB, "AE":AE, "AG":AG, "HI":HI ]
        return result
      
    }
    func calculatePantsRelaxedFitPartOne(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = (ukuranBadan["Lingkar Pinggang"]!) + 10
        let CD: Double = AB
        let BD: Double = 6.0
        let AC: Double = BD
        let EF: Double = BD
        let GH: Double = BD
        let IJ: Double = BD
        let AE: Double = AB / 4
        let EG: Double = AE
        let GI: Double = AE
        let IB: Double = AE
        let CF: Double = AE
        let FH: Double = AE
        let HJ: Double = AE
        let JD: Double = AE
       
        var result = ["AB":AB, "CD":CD, "BD":BD, "AC":AC, "EF":EF, "GH":GH, "IJ":IJ, "AE":AE, "EG":EG, "GI":GI, "IB":IB, "CF":CF, "FH":FH, "HJ":HJ, "JD":JD]
        return result
      
    }
    func calculatePantsRelaxedFitPartTwo(ukuranBadan:[String:Double]) -> [String:Double] {
        let AC: Double = (ukuranBadan["Panjang Celana"]!) + 10
        let BD: Double = AC
        let BG: Double = 10.0
        let EF: Double = 7.0
        let AB: Double = (ukuranBadan["Lingkar Pinggang"]!) / 4
        let HI: Double = ukuranBadan["1/2 Lingkar Kaki"]!
        let AE: Double = AB - 2
       
        var result = ["AC":AC, "BD":BD, "BG":BG, "EF":EF, "AB":AB, "HI":HI, "AE": AE]
        return result
      
    }
    
    func calculatePantsStandardLooseFitPartOne(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = ((ukuranBadan["Lingkar Pinggang"]!) / 2 ) + 5
        let CD: Double = AB
        let AC: Double = 6.0
        let BD: Double = AC
     
        var result = ["AB":AB, "CD":CD, "AC":AC, "BD":BD]
        return result
      
    }
    func calculatePantsStandardLooseFitPartTwo(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = (ukuranBadan["Lingkar Pinggang"]!) / 4
        let CD: Double = AB
        let AC: Double = (ukuranBadan["Lingkar Pinggang"]!)
        let BD: Double = AC
        let GH: Double = ukuranBadan["1/2 Lingkar Kaki"]!
        let EI: Double = 4
        let BJ: Double = 10
        let AI: Double = 1/6 * (ukuranBadan["Panjang Celana"]!)
        let AE: Double = sqrt((EI * EI) - (AI - AI))
        let FB: Double = 3.0
        let EF: Double = AB - AE - FB
     
        
        var result = ["AB":AB, "CD":CD, "AC":AC, "BD":BD, "GH":GH, "EI":EI, "BJ":BJ, "AI":AI, "AE":AE, "FB":FB, "EF":EF]
        return result
      
    }
   
  
}
