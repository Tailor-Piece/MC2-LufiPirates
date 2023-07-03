//
//  InputUkuranBadanView.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 27/06/23.
//

import SwiftUI

struct InputUkuranBadanView: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var desainViewModel: DesainViewModel
//    @EnvironmentObject var homepageViewModel: HomePageViewModel
//    @StateObject var ukuranBadanViewModel: UkuranBadanViewModel = UkuranBadanViewModel()
    
    @State var ukuranBadanAtasan: [String: Double?] = [
        "Lingkar Badan" : nil,
        "Lebar Dada" : nil,
        "Panjang Punggung" : nil,
        "Lebar Punggung" : nil,
        "Lebar Bahu" : nil,
        "Lingkar Pangkal Lengan" : nil,
        "Lingkar Lengan Bawah" : nil,
        "Panjang Lengan" : nil
    ]
    
    @State var ukuranBadanBawahan: [String: Double?] = [
        "Panjang Celana": nil,
        "Panjang Lutut": nil,
        "Lingkar Panggul": nil,
        "Lingkar Pesak": nil,
        "1/2 Lingkar Paha": nil,
        "1/2 Lingkar Lutut": nil,
        "1/2 Lingkar Kaki": nil,
        "Lingkar Pinggang": nil,
        "Lingkar Pinggul": nil,
    ]
    
    @State var misc: Double = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Masukkan Ukuran Badan")
                    .font(.largeTitle.bold())
                Spacer()
            }
            
            Spacer()
            
            HStack(spacing: 176) {
                VStack(spacing: 24) {
                    Image(desainViewModel.jenisPakaian == "Atasan" ? "CF_3-4S_CAC_Depan" : "SP_Depan")
                        .resizable()
                        .frame(maxWidth: 332, maxHeight: 332)
                        .aspectRatio(contentMode: .fit)
                    Text(desainViewModel.jenisPakaian ?? "Atasan")
                        .font(.title.bold())
                }
                
                ScrollView(.vertical) {
                    VStack {
                        ForEach(Array((desainViewModel.jenisPakaian?.lowercased() ?? "atasan" == "atasan" ? ukuranBadanAtasan : ukuranBadanBawahan ).keys.sorted()), id: \.self) { key in
                            HStack(spacing: 16) {
                                Text("\(key)")
                                    .foregroundColor(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField(
                                    "Value",
                                    value: Binding<Double?>(
                                        get: { desainViewModel.jenisPakaian ?? "Atasan" == "Atasan"
                                            ? ukuranBadanAtasan[key] ?? 0.0
                                            : ukuranBadanBawahan[key] ?? 0.0
                                        },
                                        set: { newValue in
                                            if let safeJenisPakaian = desainViewModel.jenisPakaian {
                                                if safeJenisPakaian == "Atasan" {
                                                    ukuranBadanAtasan[key] = newValue
                                                } else {
                                                    ukuranBadanBawahan[key] = newValue
                                                }
                                            }
                                        }
                                    ),
                                    format: .number
                                )
                                .frame(width: 75)
                                .multilineTextAlignment(.trailing)
                                
                                Text("cm")
                                    .foregroundColor(.secondary)
                            }
                            .padding(.top, 24)
                            .padding(.bottom, 12)
                            Divider()
                        }
                    }
                    .frame(maxWidth: 320)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal ,20)
        .navigationTitle("Proyek Tanpa Judul")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Selanjutnya") {
                    desainViewModel.dictUkuranBadan = desainViewModel.jenisPakaian == "Atasan" ? ukuranBadanAtasan : ukuranBadanBawahan
                    router.path.append(2.0)
                }
                .disabled({
                    if let safeJenisPakaian = desainViewModel.jenisPakaian {
                        if safeJenisPakaian == "Atasan" {
                            if ukuranBadanAtasan.filter({ $1 == nil }).isEmpty {
                                return false
                            }
                        } else {
                            if ukuranBadanBawahan.filter({ $1 == nil }).isEmpty {
                                return false
                            }
                        }
                    }
                    return true
                }())
                .cornerRadius(999)
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct InputUkuranBadanView_Previews: PreviewProvider {
    static var previews: some View {
        InputUkuranBadanView()
            .environmentObject(Router())
            .environmentObject(DesainViewModel())
    }
}
