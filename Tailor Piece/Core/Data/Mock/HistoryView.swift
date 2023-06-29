//
//  HistoryView.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 29/06/23.
//

import Foundation
import SwiftUI

struct HistoryView:View {
    
    @StateObject var desainViewModel:DesainViewModel = DesainViewModel()
    var proyek:ProyekModel

    var body: some View {
        ScrollView{
            HStack {
                Text("Nama proyek: \(proyek.namaProyek)")
                VStack{
                    Text("Sketsa\n")
                    
                    HStack{
                        Text("Tampak Depan")
                        Text(proyek.sketsa!.sketsaDepanImg)

                        Text("Tampak Belakang")
                        Text(proyek.sketsa!.sketsaBelakangImg)
                    }

                    Text("Detail Ukuran Tubuh")
                    if(proyek.jenisPakaian == "Atasan"){
                        ForEach(proyek.ukuranBadan!.toDictionaryAtasan().sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                           Text("\(key) : \(value)")
                        }
                    } else {
                        ForEach(proyek.ukuranBadan!.toDictionaryBawahan().sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                           Text("\(key) : \(value)")
                        }
                    }
                }
                VStack{
                    Text("Pola Potongan")
                    if(proyek.jenisPakaian == "Atasan"){
                        HStack{
                            VStack{
                                Text("Bentuk Pakaian")
                                Text(proyek.tipeDesain!.bentukPakaian)
                                Text("Detail Ukuran Pola")
                                ForEach(desainViewModel.getPolaBentukPakaian(ukuranBadan: proyek.ukuranBadan!.toDictionaryAtasan(), tipeDesain: proyek.tipeDesain!.bentukPakaian).sorted(by: { $0.key < $1.key }), id: \.key) { outerKey, innerDictionary in
                                    Text("\(outerKey)")
                                    
                                    ForEach(innerDictionary.sorted(by: { $0.key < $1.key }), id: \.key) { innerKey, value in
                                        Text("\(innerKey) : \(value)")
                                    }
                                }
                            }
                            
                            VStack{
                                Text("Lengan")
                                Text(proyek.tipeDesain!.lengan)
                                Text("Detail Ukuran Pola")
                                ForEach(desainViewModel.getPolaLengan(ukuranBadan: proyek.ukuranBadan!.toDictionaryAtasan(), tipeDesain: proyek.tipeDesain!.lengan).sorted(by: { $0.key < $1.key }), id: \.key) { outerKey, innerDictionary in
                                    Text("\(outerKey)")

                                    ForEach(innerDictionary.sorted(by: { $0.key < $1.key }), id: \.key) { innerKey, value in
                                        Text("\(innerKey) : \(value)")
                                    }
                                }
                            }

                            VStack{
                                Text("Leher")
                                Text(proyek.tipeDesain!.leher)
                                Text("Detail Ukuran Pola")
                                ForEach(desainViewModel.getPolaLeher(ukuranBadan: proyek.ukuranBadan!.toDictionaryAtasan(), tipeDesain: proyek.tipeDesain!.leher).sorted(by: { $0.key < $1.key }), id: \.key) { outerKey, innerDictionary in
                                    Text("\(outerKey)")

                                    ForEach(innerDictionary.sorted(by: { $0.key < $1.key }), id: \.key) { innerKey, value in
                                        Text("\(innerKey) : \(value)")
                                    }
                                }
                            }
                        }
                    } else {
                        VStack{
                            Text("Celana")
                            Image(proyek.tipeDesain!.celana)
                            Text("Detail Ukuran Pola")
                            ForEach(desainViewModel.getPolaCelana(ukuranBadan: proyek.ukuranBadan!.toDictionaryBawahan(), tipeDesain: proyek.tipeDesain!.celana).sorted(by: { $0.key < $1.key }), id: \.key) { outerKey, innerDictionary in
                                Text("\(outerKey)")

                                ForEach(innerDictionary.sorted(by: { $0.key < $1.key }), id: \.key) { innerKey, value in
                                    Text("\(innerKey) : \(value)")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
