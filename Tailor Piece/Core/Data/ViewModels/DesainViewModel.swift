//
//  DesainViewModel.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 27/06/23.
//

import Foundation
import CloudKit

class DesainViewModel: ObservableObject {
    
    @Published var proyek:ProyekModel?
    
    //Tipe Desain
    @Published var tipeDesain:TipeDesainModel?
    @Published var tipeDesainAtasan: [String:String] = ["bentukPakaian":"", "lengan":"", "leher":""]
    @Published var tipeDesainBawahan: [String:String] = ["celana":""]
    
    //Sketsa
    @Published var sketsa:SketsaModel?
    @Published var tampakSketsa:[String:String] = ["tampakDepan":"", "tampakBelakang":""]
    
    //Pola
    @Published var polaBentukPakaian: [String:[String:Int]]
    @Published var polaLengan: [String:[String:Int]]
    @Published var polaLeher: [String:[String:Int]]
    @Published var polaCelana: [String:[String:Int]]
    
    @Published var isLoading = false
    @Published var successAdd = false
    
    private let proyekRepository = ProyekRepository()
    
    init(
        tipeDesainAtasan: [String:String] = ["bentukPakaian":"", "lengan":"", "leher":""],
        tipeDesainBawahan: [String:String] = ["celana":""],
        tampakSketsa:[String:String] = ["tampakDepan":"", "tampakBelakang":""],
        polaBentukPakaian:[String:[String:Int]] = ["":["":0]],
        polaLengan:[String:[String:Int]] = ["":["":0]],
        polaLeher:[String:[String:Int]] = ["":["":0]],
        polaCelana:[String:[String:Int]] = ["":["":0]]
    ) {
        self.tipeDesainAtasan = ["bentukPakaian":"", "lengan":"", "leher":""]
        self.tipeDesainBawahan = ["celana":""]
        self.tampakSketsa = ["tampakDepan":"", "tampakBelakang":""]
        self.polaBentukPakaian = ["":["":0]]
        self.polaLengan = ["":["":0]]
        self.polaLeher = ["":["":0]]
        self.polaCelana = ["":["":0]]
    }

}

//MARK: SAVE SKETSA
extension DesainViewModel {
    func saveTipeDesain() async {
        
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        if let tipeDesainNew = try? await proyekRepository.saveTipeDesain(bentukPakaian: tipeDesainAtasan["bentukPakaian"]!, lengan: tipeDesainAtasan["lengan"]!, leher:tipeDesainAtasan["leher"]!, celana:tipeDesainBawahan["celana"]!, completion: {
            
            results in
            switch results {
            case .success(_):
                DispatchQueue.main.async {
                    self.successAdd = true
                    self.isLoading = false
                    print("Success")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Error: \(error)")
                }
            }
        }) {
            DispatchQueue.main.async {
                self.tipeDesain = tipeDesainNew
                print("Success")
            }
        }
    }
    
    func saveSketsa() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        if let sketsaNew = try? await proyekRepository.saveSketsa(sketsaDepanImg: tampakSketsa["tampakDepan"]!, sketsaBelakangImg: tampakSketsa["tampakBelakang"]!, completion: {
            
            results in
            switch results {
            case .success(_):
                DispatchQueue.main.async {
                    self.successAdd = true
                    self.isLoading = false
                    print("Success")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Error: \(error)")
                }
            }
        }) {
            DispatchQueue.main.async {
                self.sketsa = sketsaNew
                print("Success sketsa")
            }
        }
    }
    
    func saveProyek(jenisPakaian: String, ukuranBadan:UkuranBadanModel) async {
        
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        if let proyekNew = try? await proyekRepository.save(dateCreated: Date(), jenisPakaian: jenisPakaian, ukuranBadan: ukuranBadan, tipeDesain: tipeDesain, sketsa: sketsa, completion: {
            
            results in
            switch results {
            case .success(_):
                DispatchQueue.main.async {
                    self.successAdd = true
                    self.isLoading = false
                    print("Success")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Error: \(error)")
                }
            }
        }) {
            
            DispatchQueue.main.async {
                self.proyek = proyekNew
                print("Success")
            }
        }
    }
}

//MARK: SAVE POLA
//extension DesainViewModel {
//
//    func savePolaPotongan() async {
//        if bentukPakaian != "" {
//            if(bentukPakaian == "Classic Fit"){
//                await savePolaClassicFit()
//            } else if(bentukPakaian == "Modern Fit"){
//
//            } else {
//
//            }
//        } else if lengan != "" {
//            if(lengan == "Long Sleeves"){
//
//            } else if(lengan == "3/4 Sleeves"){
//
//            } else {
//
//            }
//        } else if leher != "" {
//            if(leher == "Short Collar"){
//
//            } else if(leher == "Cut Away Collar"){
//
//            }
//        } else if celana != "" {
//            if(celana == "celana 1"){
//
//            } else if(celana == "celana 2"){
//
//            } else {
//            }
//        }
//    }
//
//    func savePolaClassicFit() async {
//
//        DispatchQueue.main.async {
//            self.isLoading = true
//        }
//
//        if let newPola: ClassicFit = try? await polaPotonganRepository.save(namaPola: bentukPakaian, ukuranPola: getUkuranPolaBentukPakaian()!, completion: {
//            results in
//            switch results {
//            case .success(_):
//                DispatchQueue.main.async {
//                    self.successAdd = true
//                    self.isLoading = false
//                    print("Success")
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    print("Error: \(error)")
//                }
//            }
//        }){
//            DispatchQueue.main.async {
//                self.isLoading = false
//                self.polaBentukPakaian = newPola
//            }
//        }
//    }
//}
