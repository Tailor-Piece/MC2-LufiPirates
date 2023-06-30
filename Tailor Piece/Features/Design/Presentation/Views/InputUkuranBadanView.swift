//
//  InputUkuranBadanView.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 27/06/23.
//

import SwiftUI

struct InputUkuranBadanView: View {
    
    @EnvironmentObject var router: Router
    
    @State var ukuranBadan: [String: Double?] = [
        "Lingkaran Badan": 0,
        "Lebar Dada": 0,
        "Panjang Punggung": 0,
        "Lebar Punggung": 0,
        "Lebar Bahu": 0,
        "Lingkar Pangkal Lengan": 0,
        "Lingkar Lengan Bawah": 0,
        "Panjang Lengan": 0,
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
                    RoundedRectangle(cornerRadius: 15)
                        .frame(maxWidth: 332, maxHeight: 332)
                        .aspectRatio(contentMode: .fit)
                        .shimmer(ShimmerConfig(tint: .gray.opacity(0.2), highlight: .white))
                    Text("Atasan")
                        .font(.title.bold())
                }
                VStack {
                    ForEach(Array(ukuranBadan.keys.sorted()), id: \.self) { key in
                        HStack(spacing: 16) {
                            Text("\(key)")
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
//                            TextField(value: $ukuranBadan[key], format: NumberFormatter(), prompt: "Value")
                            TextField("Value", value: $misc, format: .number)
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
    }
}
