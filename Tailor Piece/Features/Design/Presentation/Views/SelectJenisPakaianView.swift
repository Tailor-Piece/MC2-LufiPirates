//
//  SecondView.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 21/06/23.
//

import SwiftUI

struct SelectJenisPakaianView: View {
    @EnvironmentObject var router: Router
    
    @State var selectedPakaian: String? = nil
//    @EnvironmentObject var homepageViewModel: HomePageViewModel
    @EnvironmentObject var desainViewModel: DesainViewModel

    
    var body: some View {
        VStack {
            HStack {
                Text("Pilih Jenis Pakaian")
                    .font(.title.bold())
                Spacer()
            }
            Spacer()
            
            HStack(spacing: 32) {
                ForEach(["Atasan", "Bawahan"], id: \.self) {jenisPakaian in
                    JenisPakaianCard(selectedPakaian: $selectedPakaian, jenisPakaian: jenisPakaian)
                }
            }
            Spacer()
        }
        .padding(.horizontal ,20)
        .navigationTitle("Proyek Tanpa Judul")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Selanjutnya") {
                    router.path.append(1.0)
                }
                .disabled(selectedPakaian == nil)
                .cornerRadius(999)
                .buttonStyle(.borderedProminent)
                .animation(.linear(duration: 0.1), value: selectedPakaian)
            }
        }
        .onChange(of: selectedPakaian) { newValue in
            desainViewModel.jenisPakaian = selectedPakaian
        }
    }
}

struct JenisPakaianCard: View {
    @Binding var selectedPakaian: String?
    let jenisPakaian: String
    
    var body: some View {
        let isSelected = selectedPakaian == jenisPakaian
        
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 36) {
                Image(jenisPakaian == "Atasan" ? "CF_3-4S_CAC_Depan" : "SP_Depan")
                    .resizable()
                    .frame(maxWidth: 220, maxHeight: 220)
                    .aspectRatio(contentMode: .fit)
//                    .shimmer(ShimmerConfig(tint: .gray.opacity(0.05), highlight: .white))
                Text("\(jenisPakaian)")
                    .foregroundColor(isSelected ? .indigo : nil)
                    .bold(isSelected)
            }
            .padding(24)
            .overlay {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(isSelected ? .indigo : .gray.opacity(0.3), lineWidth: isSelected ? 3 : 1.5)
            }
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.indigo)
                    .padding(20)
            }
        }
        .onTapGesture {
            selectedPakaian = selectedPakaian == jenisPakaian ? nil : jenisPakaian
        }
        .animation(.linear(duration: 0.08), value: isSelected)
    }
}

struct SelectJenisPakaianView_Previews: PreviewProvider {
    static var previews: some View {
        SelectJenisPakaianView().environmentObject(Router())
    }
}

