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
    @Published var namaProyek:String
    
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
    @Published var successAddTipeDesain = false
    @Published var successAddSketsa = false
    @Published var successAddProyek = false
    
    @Published var listBentukPakaian:[String] = ["Classic Fit", "Modern Fit", "Slim Fit"]
    @Published var listLengan:[String] = ["Long Sleeves", "3/4 Sleeves", "Short Sleeves"]
    @Published var listLeher:[String] = ["Short Collar", "Cut-Away Colar", "Classic Colar"]
    @Published var listCelana:[String] = ["celana 1", "celana 2", "celana 3"]

    
    private let proyekRepository = ProyekRepository()
    
    init(
        namaProyek: String = "",
        tipeDesainAtasan: [String:String] = ["bentukPakaian":"", "lengan":"", "leher":""],
        tipeDesainBawahan: [String:String] = ["celana":""],
        tampakSketsa:[String:String] = ["tampakDepan":"", "tampakBelakang":""],
        polaBentukPakaian:[String:[String:Int]] = ["":["":0]],
        polaLengan:[String:[String:Int]] = ["":["":0]],
        polaLeher:[String:[String:Int]] = ["":["":0]],
        polaCelana:[String:[String:Int]] = ["":["":0]]
    ) {
        self.namaProyek = ""
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
                    self.successAddTipeDesain = true
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
                    self.successAddSketsa = true
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
                print("Success")
            }
        }
    }
    
    func saveProyek(jenisPakaian: String, ukuranBadan:UkuranBadanModel) async {
        
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        if let proyekNew = try? await proyekRepository.save(namaProyek:namaProyek, dateCreated: Date(), jenisPakaian: jenisPakaian, ukuranBadan: ukuranBadan, tipeDesain: tipeDesain, sketsa: sketsa, completion: {
            
            results in
            switch results {
            case .success(_):
                DispatchQueue.main.async {
                    self.successAddProyek = true
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
    
    //MARK: NOT DONE
//    func changeNamaProyek(namaProyek: String) async {
//
//        DispatchQueue.main.async {
//            self.isLoading = true
//        }
//
//        if let newProyek = try? await proyekRepository.changeNamaProyek(namaProyek:namaProyek, completion: {
//
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
//        }) {
//
//            DispatchQueue.main.async {
//                self.proyek = newProyek
//                self.namaProyek = namaProyek
//                print("Success")
//            }
//        }
//    }
}
