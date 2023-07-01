////
////  DesignView.swift
////  Tailor Piece
////
////  Created by Salsabila Zahra Chinanti on 26/06/23.
////
//
//import Foundation
//import SwiftUI
//
//struct DesignViewMock:View {
//
//    @StateObject var homepageViewModel = HomePageViewModel()
//    @StateObject var desainViewModel = DesainViewModel()
//    @StateObject var ukuranBadanViewModel:UkuranBadanViewModel
//    @State var namaProyek:String
//    var jenisPakaian:String
//
//    private let bentukPakaian:[String] = ["Classic Fit", "Modern Fit", "Slim Fit"]
//    private let lengan:[String] = ["Long Sleeves", "3/4 Sleeves", "Short Sleeves"]
//    private let leher:[String] = ["Short Collar", "Cut-Away Colar", "Classic Colar"]
//    private let celana:[String] = ["celana 1", "celana 2", "celana 3"]

//    @State private var bentukPakaianChosen = ""
//    @State private var lenganChosen = ""
//    @State private var leherChosen = ""
//    @State private var celanaChosen = ""
//
//    func changeSketsa() {
//        let sketsa:[String]
//        if(jenisPakaian == "Atasan"){
//            sketsa = desainViewModel.getSketsa(
//                bentukPakaian: desainViewModel.tipeDesainAtasan["bentukPakaian"]!,
//                lengan: desainViewModel.tipeDesainAtasan["lengan"]!,
//                leher: desainViewModel.tipeDesainAtasan["leher"]!)
//        } else {
//            sketsa = desainViewModel.getSketsaBawahan(celana: desainViewModel.tipeDesainBawahan["celana"]!)
//        }
//        desainViewModel.tampakSketsa = ["tampakDepan":sketsa[0], "tampakBelakang":sketsa[1]]
//    }
//
//    var body: some View {
//        ScrollView{
//            HStack {
//                VStack{
//                    TextField("Nama proyek", text: $namaProyek)
//                        .padding(.bottom, 20)
//
//                    Text("Tipe Desain")
//
//                    if (jenisPakaian == "Atasan"){
//                        Picker("", selection: $bentukPakaianChosen) {
//                            ForEach(bentukPakaian, id: \.self) { cloth in
//                                Text(cloth).tag(cloth)
//                            }
//                        }
//                        .onChange(of: bentukPakaianChosen) { sketsa in
//                            self.desainViewModel.tipeDesainAtasan["bentukPakaian"] = bentukPakaianChosen
//                            changeSketsa()
//                        }
//
//                        Picker("", selection: $lenganChosen) {
//                            ForEach(lengan, id: \.self) { cloth in
//                                Text(cloth).tag(cloth)
//                            }
//                        }
//                        .onChange(of: lenganChosen) { sketsa in
//                            self.desainViewModel.tipeDesainAtasan["lengan"] = lenganChosen
//                            changeSketsa()
//                        }
//
//                        Picker("", selection: $leherChosen) {
//                            ForEach(leher, id: \.self) { cloth in
//                                Text(cloth).tag(cloth)
//                            }
//                        }
//                        .onChange(of: leherChosen) { sketsa in
//                            self.desainViewModel.tipeDesainAtasan["leher"] = leherChosen
//                            changeSketsa()
//                        }
//                    } else {
//                        Picker("", selection: $celanaChosen) {
//                            ForEach(celana, id: \.self) { cloth in
//                                Text(cloth).tag(cloth)
//                            }
//                        }
//                        .onChange(of: celanaChosen) { sketsa in
//                            self.desainViewModel.tipeDesainBawahan["celana"] = celanaChosen
//                            changeSketsa()
//                        }
//                    }
//                }
//                VStack{
//                    Text("Sketsa\n")
//
//                    HStack{
//                        Text("Tampak Depan")
//                        Text(desainViewModel.tampakSketsa["tampakDepan"]!)
//
//                        Text("Tampak Belakang")
//                        Text(desainViewModel.tampakSketsa["tampakBelakang"]!)
//                    }
//
//                    Text("Detail Ukuran Tubuh")
//                    if(jenisPakaian == "Atasan"){
//                        ForEach((ukuranBadanViewModel.toDictionaryAtasan().sorted(by: <)), id: \.key) { key, value in
//                           Text("\(key) : \(value)")
//                        }
//                    } else {
//                        ForEach((ukuranBadanViewModel.toDictionaryBawahan().sorted(by: <)), id: \.key) { key, value in
//                           Text("\(key) : \(value)")
//                        }
//                    }
//                }
//                VStack{
//                    Text("Pola Potongan")
//                    if(jenisPakaian == "Atasan"){
//                        HStack{
//                            VStack{
//                                Text("Bentuk Pakaian")
//                                Text(desainViewModel.tipeDesainAtasan["bentukPakaian"]!)
//                                Text("Detail Ukuran Pola")
//                                ForEach(desainViewModel.getPolaBentukPakaian(ukuranBadan: ukuranBadanViewModel.toDictionaryAtasan(), tipeDesain: desainViewModel.tipeDesainAtasan["bentukPakaian"]!).sorted(by: { $0.key < $1.key }), id: \.key) { outerKey, innerDictionary in
//                                    Text("\(outerKey)")
//
//                                    ForEach(innerDictionary.sorted(by: { $0.key < $1.key }), id: \.key) { innerKey, value in
//                                        Text("\(innerKey) : \(value)")
//                                    }
//                                }
//                            }
//
//                            VStack{
//                                Text("Lengan")
//                                Text(desainViewModel.tipeDesainAtasan["lengan"]!)
//                                Text("Detail Ukuran Pola")
//                                ForEach(desainViewModel.getPolaLengan(ukuranBadan: ukuranBadanViewModel.toDictionaryAtasan(), tipeDesain: desainViewModel.tipeDesainAtasan["lengan"]!).sorted(by: { $0.key < $1.key }), id: \.key) { outerKey, innerDictionary in
//                                    Text("\(outerKey)")
//
//                                    ForEach(innerDictionary.sorted(by: { $0.key < $1.key }), id: \.key) { innerKey, value in
//                                        Text("\(innerKey) : \(value)")
//                                    }
//                                }
//                            }
//
//                            VStack{
//                                Text("Leher")
//                                Text(desainViewModel.tipeDesainAtasan["leher"]!)
//                                Text("Detail Ukuran Pola")
//                                ForEach(desainViewModel.getPolaLeher(ukuranBadan: ukuranBadanViewModel.toDictionaryAtasan(), tipeDesain: desainViewModel.tipeDesainAtasan["leher"]!).sorted(by: { $0.key < $1.key }), id: \.key) { outerKey, innerDictionary in
//                                    Text("\(outerKey)")
//
//                                    ForEach(innerDictionary.sorted(by: { $0.key < $1.key }), id: \.key) { innerKey, value in
//                                        Text("\(innerKey) : \(value)")
//                                    }
//                                }
//                            }
//                        }
//                    } else {
//                        VStack{
//                            Text("Celana")
//                            Image(desainViewModel.tipeDesainBawahan["celana"]!)
//                            Text("Detail Ukuran Pola")
//                            ForEach(desainViewModel.getPolaCelana(ukuranBadan: ukuranBadanViewModel.toDictionaryBawahan(), tipeDesain: desainViewModel.tipeDesainBawahan["celana"]!).sorted(by: { $0.key < $1.key }), id: \.key) { outerKey, innerDictionary in
//                                Text("\(outerKey)")
//
//                                ForEach(innerDictionary.sorted(by: { $0.key < $1.key }), id: \.key) { innerKey, value in
//                                    Text("\(innerKey) : \(value)")
//                                }
//                            }
//                        }
//                    }
//                }
//                Button() {
//                    Task {
//                        await ukuranBadanViewModel.save()
//                        await desainViewModel.saveTipeDesain()
//                        await desainViewModel.saveSketsa()
//                        self.desainViewModel.namaProyek = namaProyek
//                        await desainViewModel.saveProyek(jenisPakaian: jenisPakaian, ukuranBadan: ukuranBadanViewModel.ukuranBadan!)
//                    }
//
//                } label: {
//                    if ukuranBadanViewModel.isLoading {
//                        ProgressView().progressViewStyle(.circular)
//                    } else {
//                        Text("Save")
//                            .fontWeight(.bold)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background {
//                            }
//                            .cornerRadius(8)
//                    }
//                }
//
//            }
//        }
//
//    }
//}
