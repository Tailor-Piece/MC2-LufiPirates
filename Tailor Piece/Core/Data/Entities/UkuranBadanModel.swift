//
//  UkuranBadanModel.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 27/06/23.
//

import CloudKit

class UkuranBadanModel : Identifiable {
    static let recordType = "UkuranBadanModel"
    var recordId: CKRecord.ID
    
    //for atasan
    var lingkarBadan: Double
    var lebarDada: Double
    var panjangPunggung: Double
    var lebarPunggung: Double
    var lebarBahu: Double
    var lingkarPangkalLengan: Double
    var lingkarLenganBawah: Double
    var panjangLengan: Double

    
    //for bawahan
    var panjangCelana: Double
    var panjangLutut: Double
    var lingkarPanggul: Double
    var lingkarPesak: Double
    var setengahLingkarPaha: Double
    var setengahLingkarLutut: Double
    var setengahLingkarKaki: Double
    var lingkarPinggang: Double
    var lingkarPinggul: Double
    
    init?(record: CKRecord) {
        guard
            //for atasan
            let lingkarBadan = record["lingkarBadan"] as? Double,
            let lebarDada = record["lebarDada"] as? Double,
            let panjangPunggung = record["panjangPunggung"] as? Double,
            let lebarPunggung = record["lebarPunggung"] as? Double,
            let lebarBahu = record["lebarBahu"] as? Double,
            let lingkarPangkalLengan = record["lingkarPangkalLengan"] as? Double,
            let lingkarLenganBawah = record["lingkarLenganBawah"] as? Double,
            let panjangLengan = record["panjangLengan"] as? Double,
                
            //for bawahan
            let panjangCelana = record["panjangCelana"] as? Double,
            let panjangLutut = record["panjangLutut"] as? Double,
            let lingkarPanggul = record["lingkarPanggul"] as? Double,
            let lingkarPesak = record["lingkarPesak"] as? Double,
            let setengahLingkarPaha = record["setengahLingkarPaha"] as? Double,
            let setengahLingkarLutut = record["setengahLingkarLutut"] as? Double,
            let setengahLingkarKaki = record["setengahLingkarKaki"] as? Double,
            let lingkarPinggang = record["lingkarPinggang"] as? Double,
            let lingkarPinggul = record["lingkarPinggul"] as? Double
        else { return nil }
        
        recordId = record.recordID
        
        //for atasan
        self.lingkarBadan = lingkarBadan
        self.lebarDada = lebarDada
        self.panjangPunggung = panjangPunggung
        self.lebarPunggung = lebarPunggung
        self.lebarBahu = lebarBahu
        self.lingkarPangkalLengan = lingkarPangkalLengan
        self.lingkarLenganBawah = lingkarLenganBawah
        self.panjangLengan = panjangLengan
        
        //for bawahan
        self.panjangCelana = panjangCelana
        self.panjangLutut = panjangLutut
        self.lingkarPanggul = lingkarPanggul
        self.lingkarPesak = lingkarPesak
        self.setengahLingkarPaha = setengahLingkarPaha
        self.setengahLingkarLutut = setengahLingkarLutut
        self.setengahLingkarKaki = setengahLingkarKaki
        self.lingkarPinggang = lingkarPinggang
        self.lingkarPinggul = lingkarPinggul
    }
}

extension UkuranBadanModel : Hashable {
    static func == (ukuranBadan1 : UkuranBadanModel, ukuranBadan2 : UkuranBadanModel) -> Bool {
        return ukuranBadan1.recordId == ukuranBadan2.recordId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(recordId)
    }
    
    func toDictionary(jenisPakaian:String) -> [String:Double?] {
        var dict : [String:Double?] = [:]
        if(jenisPakaian == "Atasan"){
            dict = [
                "Lingkar Badan" : lingkarBadan,
                "Lebar Dada" : lebarDada,
                "Panjang Punggung" : panjangPunggung,
                "Lebar Punggung" : lebarPunggung,
                "Lebar Bahu" : lebarBahu,
                "Lingkar Pangkal Lengan" : lingkarPangkalLengan,
                "Lingkar Lengan Bawah" : lingkarLenganBawah,
                "Panjang Lengan" : panjangLengan
                
            ]
        }
        else {
            dict = [
                "Panjang Celana" : panjangCelana,
                "Panjang Lutut" : panjangLutut,
                "Lingkar Panggul" : lingkarPanggul,
                "Lingkar Pesak" : lingkarPesak,
                "1/2 Lingkar Paha" : setengahLingkarPaha,
                "1/2 Lingkar Lutut" : setengahLingkarLutut,
                "1/2 Lingkar Kaki" : setengahLingkarKaki,
                "Lingkar Pinggang" : lingkarPinggang,
                "Lingkar Pinggul" : lingkarPinggul
            ]
        }
        return dict
    }
    
//    func toDictionaryAtasan() -> [String:Int] {
//        let dict : [String:Int] = [
//            "Lingkar Badan" : lingkarBadan,
//            "Panjang Dada" : panjangDada,
//            "Lebar Dada" : lebarDada,
//            "Tinggi Dada" : tinggiDada,
//            "Panjang Punggung" : panjangPunggung,
//            "Lebar Punggung" : lebarPunggung,
//            "Lebar Bahu" : lebarBahu,
//            "Lingkar Pinggang" : lingkarPinggang,
//            "Lingkar Pinggul" : lingkarPinggul
//        ]
//        return dict
//    }
//
//    func toDictionaryBawahan() -> [String:Int] {
//        let dict : [String:Int] = [
//            "Panjang Celana" : panjangCelana,
//            "Panjang Lutut" : panjangLutut,
//            "Lingkar Panggul" : lingkarPanggul,
//            "Lingkar Pesak" : lingkarPesak,
//            "1/2 Lingkar Paha" : SetengahLingkarPaha,
//            "1/2 Lingkar Lutut" : SetengahLingkarLutut,
//            "1/2 Lingkar Kaki" : SetengahLingkarKaki,
//            "Lingkar Pinggang" : lingkarPinggang,
//            "Lingkar Pinggul" : lingkarPinggul
//        ]
//        return dict
//    }
}

