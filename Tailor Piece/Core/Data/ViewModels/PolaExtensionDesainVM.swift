//
//  PolaExtensionDesainVM.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 28/06/23.
//

import Foundation

//MARK: GET UKURAN POLA
extension DesainViewModel {
    
    func getPolaBentukPakaian(ukuranBadan:[String:Double], tipeDesain:String) -> [String:[String:Double]] {
        return calculateClothesSize(ukuranBadan: ukuranBadan)
    }
    
    func getPolaLengan(ukuranBadan:[String:Double], tipeDesain:String) -> [String:[String:Double]] {
        var pola1 = calculateShortSleeves(ukuranBadan: ukuranBadan)
        if (tipeDesain == "Long Sleeves") {
            var pola2 = calculateLongSleevesOnlyPartOne(ukuranBadan: ukuranBadan)
            var pola3 = calculateLongSleevesOnlyPartTwo(ukuranBadan: ukuranBadan)
            var pola4 = calculateLongSleevesOnlyPartThree(ukuranBadan: ukuranBadan)
            return ["pola1":pola1, "pola2":pola2, "pola3":pola3, "pola4":pola4]
        }
        else{
            return ["pola1":pola1]
        }
    
    }
    
    func getPolaLeher(ukuranBadan:[String:Double], tipeDesain:String) -> [String:[String:Double]] {
         return calculateCollarSize(ukuranBadan: ukuranBadan)
    }
    
    func getPolaCelana(ukuranBadan:[String:Double], tipeDesain:String) -> [String:[String:Double]] {
        
        var pola1 = calculatePantsAllSize(ukuranBadan: ukuranBadan)
        if tipeDesain  == "Relaxed Fit"{
            var pola2 = calculatePantsRelaxedFitPartOne(ukuranBadan: ukuranBadan)
            var pola3 = calculatePantsRelaxedFitPartTwo(ukuranBadan: ukuranBadan)
            return ["pola1":pola1, "pola2": pola2, "pola3": pola3]
        }else {
            var pola2 = calculatePantsStandardLooseFitPartOne(ukuranBadan: ukuranBadan)
            var pola3 = calculatePantsStandardLooseFitPartTwo(ukuranBadan: ukuranBadan)
            return ["pola1":pola1, "pola2": pola2, "pola3": pola3]
        }
    }
}

//MARK: CALCULATION
extension DesainViewModel {
    
    func calculateClothesSize(ukuranBadan:[String:Double]) -> [String:[String:Double]] {
        var pola1 = calculateBodyPart(ukuranBadan: ukuranBadan)
        var pola2 = calculateShoulderPart(ukuranBadan: ukuranBadan)
        var pola3 = calculateCollarPartOnClothes(ukuranBadan: ukuranBadan)
        
        //MARK: CALCULATION
        return ["pola1":pola1, "pola2":pola2, "pola3": pola3]
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
        
        var result = ["AB":AB, "CD":CD, "AC":AC, "BD":BD, "HB":HB, "AG":AG, "BF":BF, "AE":AE, "FD":FD, "EC":EC, "GH":GH]
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
        
        var result = ["AB":AB, "IJ":IJ, "EB":EB, "BF":BF, "CD":CD, "DE":DE, "CE":CE, "GH":GH, "AG":AG]
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
        
        var result = ["AB":AB, "CD":CD, "BD":BD, "AC":AC, "AF":AF, "GH":GH, "EF":EF, "IJ":IJ]
        return result
    }
    
    // Tipe Pola Leher
    func calculateCollarSize(ukuranBadan:[String:Double]) -> [String:[String:Double]] {
        var pola1 = calculateCollarPartOne(ukuranBadan: ukuranBadan)
        var pola2 = calculateCollarPartTwo(ukuranBadan: ukuranBadan)
        return ["pola1":pola1, "pola2":pola2]
    }
    
    func calculateCollarPartOne(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = Double( 1/2 * ((ukuranBadan["Lingkar Badan"]!) + 5 ))
        let CD: Double = AB
        let BD: Double = 6.0
        let AC: Double = BD
        
        var result = ["AB":AB, "CD":CD, "BD":BD, "AC":AC]
        return result
    }
    
    func calculateCollarPartTwo(ukuranBadan:[String:Double]) -> [String:Double]  {
        let AB: Double = Double((1/2 * ((ukuranBadan["Lingkar Badan"]!) + 5 )) + 3)
        let CD: Double = AB
        let BD: Double = 3.0
        let AC: Double = BD
        
        var result = ["AB":AB, "CD":CD, "BD":BD, "AC":AC]
        return result
    }
    
    // Tipe pola Lengan
    func calculateShortSleeves(ukuranBadan:[String:Double]) -> [String:Double] {
        let AB: Double = (ukuranBadan["Lingkar Pangkal Lengan"]!)
        let AC: Double = (1/2 * (ukuranBadan["Lingkar Pangkal Lengan"]!)) - 0.5
        let CB: Double = AC
        let CD: Double = (ukuranBadan["Panjang Lengan"]!)
        let EF: Double = (ukuranBadan["Lingkar Pangkal Bawah"]!)
        
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
        let HI: Double = 1/2 * (ukuranBadan["Lingkar Kaki"]!)
       
       
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
        let HI: Double = 1/2 * (ukuranBadan["Lingkar Kaki"]!)
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
        let GH: Double = 1/2 * (ukuranBadan["Lingkar Kaki"]!)
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
