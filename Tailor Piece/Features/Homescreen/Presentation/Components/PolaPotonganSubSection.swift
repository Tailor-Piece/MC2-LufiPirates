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
    
    var body: some View {
        VStack {
            HStack {
                Text("Pola Potongan")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            
            Picker("Hello", selection: $polaPotonganCurrentTab) {
                Text("Bentuk Pakaian").tag(PolaPotonganTab.bentukPakaian)
                Text("Lengan").tag(PolaPotonganTab.lengan)
                Text("Leher").tag(PolaPotonganTab.leher)
            }
            .pickerStyle(.segmented)
            .padding(.vertical, 12)
            
            RoundedRectangle(cornerRadius: 8)
                .frame(maxWidth: 432)
                .aspectRatio(contentMode: .fit)
                .shimmer(ShimmerConfig(tint: .gray.opacity(0.3), highlight: .white))
            
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
        .frame(width: 557, height: 763, alignment: .top)

        // TODO: WILL BE DELETED!
        .padding(.horizontal, 400)
    }
}

struct PolaPotonganSubSection_Previews: PreviewProvider {
    static var previews: some View {
        PolaPotonganSubSection()
    }
}
