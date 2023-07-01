//
//  SketsaSubSection.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 22/06/23.
//

import SwiftUI

enum PolaPotonganTab {
    case bentukPakaian, lengan, leher
}

struct PolaPotonganSubSection: View {
    @State var polaPotonganCurrentTab: PolaPotonganTab = .bentukPakaian
    @EnvironmentObject var desainViewModel: DesainViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                HStack {
                    Text("Pola Potongan")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding(.vertical, 16)
                
                Picker("Hello", selection: $polaPotonganCurrentTab) {
                    Text("Bentuk Pakaian").tag(PolaPotonganTab.bentukPakaian)
                    Text("Lengan").tag(PolaPotonganTab.lengan)
                    Text("Leher").tag(PolaPotonganTab.leher)
                }
                .pickerStyle(.segmented)
                
                switch polaPotonganCurrentTab {
                case .bentukPakaian:
                    Image("\(Array(self.desainViewModel.polaBentukPakaian.keys)[0])")
                        .resizable()
                        .frame(maxWidth: 436, maxHeight: 348)
                        .aspectRatio(contentMode: .fit)
                case .lengan:
                    Image("\(self.desainViewModel.polaLengan["Pola_LS"])")
                        .resizable()
                        .frame(maxWidth: 436, maxHeight: 348)
                        .aspectRatio(contentMode: .fit)
                case .leher:
                    Image("\(self.desainViewModel.polaLeher["Pola_SC"])")
                        .resizable()
                        .frame(maxWidth: 436, maxHeight: 348)
                        .aspectRatio(contentMode: .fit)
                }
                
//                RoundedRectangle(cornerRadius: 8)
//                    .frame(maxWidth: 436, maxHeight: 348)
//                    .aspectRatio(contentMode: .fit)
//                    .shimmer(ShimmerConfig(tint: .gray.opacity(0.3), highlight: .white))
                
                VStack(spacing: 8) {
                    HStack{
                        Text("Detail Ukuran Pola")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(0...5, id: \.self) { _ in
                            HStack {
                                Text("Lebar lengan")
                                    .frame(minWidth: 160, alignment: .leading)
                                Text(":")
                                Text("12 cm")
                                    .bold()
                                Spacer()
                            }
                            .font(.caption)
                        }
                    }
                }
                
                
            }
        }

    }
}

struct PolaPotonganSubSection_Previews: PreviewProvider {
    static var previews: some View {
        PolaPotonganSubSection()
    }
}
