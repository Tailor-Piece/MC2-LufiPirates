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
    var lingkarBadan: Int
    var panjangDada: Int
    var lebarDada: Int
    var tinggiDada: Int
    var panjangPunggung: Int
    var lebarPunggung: Int
    var lebarBahu: Int
    
    //for bawahan
    var panjangCelana: Int
    var panjangLutut: Int
    var lingkarPanggul: Int
    var lingkarPesak: Int
    var SetengahLingkarPaha: Int
    var SetengahLingkarLutut: Int
    var SetengahLingkarKaki: Int
    
    //for both
    var lingkarPinggang: Int
    var lingkarPinggul: Int
    
    init?(record: CKRecord) {
        guard
            //for atasan
            let lingkarBadan = record["lingkarBadan"] as? Int,
            let panjangDada = record["panjangDada"] as? Int,
            let lebarDada = record["lebarDada"] as? Int,
            let tinggiDada = record["tinggiDada"] as? Int,
            let panjangPunggung = record["panjangPunggung"] as? Int,
            let lebarPunggung = record["lebarPunggung"] as? Int,
            let lebarBahu = record["lebarBahu"] as? Int,
            
            //for bawahan
            let panjangCelana = record["panjangCelana"] as? Int,
            let panjangLutut = record["panjangLutut"] as? Int,
            let lingkarPanggul = record["lingkarPanggul"] as? Int,
            let lingkarPesak = record["lingkarPesak"] as? Int,
            let SetengahLingkarPaha = record["setengahLingkarPaha"] as? Int,
            let SetengahLingkarLutut = record["setengahLingkarLutut"] as? Int,
            let SetengahLingkarKaki = record["setengahLingkarKaki"] as? Int,

            //for both
            let lingkarPinggang = record["lingkarPinggang"] as? Int,
            let lingkarPinggul = record["lingkarPinggul"] as? Int
        else { return nil }
        
        recordId = record.recordID
        
        //for atasan
        self.lingkarBadan = lingkarBadan
        self.panjangDada = panjangDada
        self.lebarDada = lebarDada
        self.tinggiDada = tinggiDada
        self.panjangPunggung = panjangPunggung
        self.lebarPunggung = lebarPunggung
        self.lebarBahu = lebarBahu
        
        //for bawahan
        self.panjangCelana = panjangCelana
        self.panjangLutut = panjangLutut
        self.lingkarPanggul = lingkarPanggul
        self.lingkarPesak = lingkarPesak
        self.SetengahLingkarPaha = SetengahLingkarPaha
        self.SetengahLingkarLutut = SetengahLingkarLutut
        self.SetengahLingkarKaki = SetengahLingkarKaki
        
        //for both
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
    
    func toList() -> [Int] {
        var listUkuranBadan: [Int] = [
            lingkarBadan,
            panjangDada,
            lebarDada,
            tinggiDada,
            panjangPunggung,
            lebarPunggung,
            lebarBahu,
            panjangCelana,
            panjangLutut,
            lingkarPanggul,
            lingkarPesak,
            SetengahLingkarPaha,
            SetengahLingkarLutut,
            SetengahLingkarKaki,
            lingkarPinggang,
            lingkarPinggul
        ]
        listUkuranBadan.removeAll { $0 == 0 }
        return listUkuranBadan
    }
    
    func toDictionary() -> [String:Int] {
        let dict : [String:Int] = [
            "Lingkar Badan" : lingkarBadan,
            "Panjang Dada" : panjangDada,
            "Lebar Dada" : lebarDada,
            "Tinggi Dada" : tinggiDada,
            "Panjang Punggung" : panjangPunggung,
            "Lebar Punggung" : lebarPunggung,
            "Lebar Bahu" : lebarBahu,
            "Panjang Celana" : panjangCelana,
            "Panjang Lutut" : panjangLutut,
            "Lingkar Panggul" : lingkarPanggul,
            "Lingkar Pesak" : lingkarPesak,
            "1/2 Lingkar Paha" : SetengahLingkarPaha,
            "1/2 Lingkar Lutut" : SetengahLingkarLutut,
            "1/2 Lingkar Kaki" : SetengahLingkarKaki,
            "Lingkar Pinggang" : lingkarPinggang,
            "Lingkar Pinggul" : lingkarPinggul
        ]
        return dict.filter { $0.value != 0 }
    }
}

