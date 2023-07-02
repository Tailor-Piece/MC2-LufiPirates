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
        "Lingkar Badan": 0,
        "Panjang Dada": 0,
        "Lebar Dada": 0,
        "Tinggi Dada": 0,
        "Panjang Punggung": 0,
        "Lebar Punggung": 0,
        "Lebar Bahu": 0,
        "Lingkar Pinggang": 0,
        "Lingkar Pinggul": 0
    ]
    
    @State var ukuranBadanBawahan: [String: Double?] = [
        "Panjang Celana": 0,
        "Panjang Lutut": 0,
        "Lingkar Panggul": 0,
        "Lingkar Pesak": 0,
        "1/2 Lingkar Paha": 0,
        "1/2 Lingkar Lutut": 0,
        "1/2 Lingkar Kaki": 0,
        "Lingkar Pinggang": 0,
        "Lingkar Pinggul": 0,
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
                    //                        .shimmer(ShimmerConfig(tint: .gray.opacity(0.2), highlight: .white))
                    Text(desainViewModel.jenisPakaian ?? "Atasan")
                        .font(.title.bold())
                }
                VStack {
                    ForEach(Array((desainViewModel.jenisPakaian?.lowercased() ?? "atasan" == "atasan" ? ukuranBadanAtasan : ukuranBadanBawahan ).keys.sorted()), id: \.self) { key in
                        HStack(spacing: 16) {
                            Text("\(key)")
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            // TODO: Fix texfield issue
                            
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
            
            Spacer()
        }
        .padding(.horizontal ,20)
        .navigationTitle("Proyek Tanpa Judul")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Selanjutnya") {
                    desainViewModel.dictUkuranBadan = desainViewModel.jenisPakaian == "Atasan" ? ukuranBadanAtasan : ukuranBadanBawahan
                    print(ukuranBadanAtasan)
                    router.path.append(2.0)
                }
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
