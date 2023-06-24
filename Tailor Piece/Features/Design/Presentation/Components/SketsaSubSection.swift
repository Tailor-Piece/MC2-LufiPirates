//
//  SketsaSubSection.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 22/06/23.
//

import SwiftUI

enum SketsaTab {
case tampakDepan, tampakBelakang
}

struct SketsaSubSection: View {
    @State var sketsaCurrentTab: SketsaTab = .tampakDepan
    
    var body: some View {
        VStack {
            HStack {
                Text("Sketsa")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            
            Picker("Hello", selection: $sketsaCurrentTab) {
                Text("Tampak Depan").tag(SketsaTab.tampakDepan)
                Text("Tampak Belakang").tag(SketsaTab.tampakBelakang)
            }
            .pickerStyle(.segmented)
            
            RoundedRectangle(cornerRadius: 8)
                .frame(maxWidth: 432)
                .aspectRatio(contentMode: .fit)
                .shimmer(ShimmerConfig(tint: .gray.opacity(0.3), highlight: .white))
            
            VStack(spacing: 8) {
                HStack {
                    Text("Detail Ukuran Tubuh")
                        .font(.title3)
                        .bold()
                    Spacer()
                    Button {
                        print("Edit sketsa clicked!")
                    } label: {
                        HStack(spacing: 3) {
                            Image(systemName: "pencil")
                            Text("Edit")
                        }
                    }
                    .font(.subheadline)
                    .bold()
                    .tint(.indigo)
                    
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

struct SketsaSubSection_Previews: PreviewProvider {
    static var previews: some View {
        SketsaSubSection()
    }
}
