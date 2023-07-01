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
    @EnvironmentObject var desainViewModel: DesainViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                HStack {
                    Text("Sketsa")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding(.vertical, 16)
                
                Picker("Hello", selection: $sketsaCurrentTab) {
                    Text("Tampak Depan").tag(SketsaTab.tampakDepan)
                    Text("Tampak Belakang").tag(SketsaTab.tampakBelakang)
                }
                .pickerStyle(.segmented)
                
                // TODO: Ganti jadi foto
                RoundedRectangle(cornerRadius: 8)
                    .frame(maxWidth: 436, maxHeight: 348)
                    .aspectRatio(contentMode: .fit)
                    .shimmer(ShimmerConfig(tint: .gray.opacity(0.3), highlight: .white))
                
                VStack(spacing: 8) {
                    HStack {
                        Text("Detail Ukuran Tubuh")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Button {
                            // TODO: Add action to edit
                            print("Edit sketsa clicked!")
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .font(.subheadline)
                        .bold()
                        .tint(.indigo)
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach((desainViewModel.toDictionary().sorted(by: {$0.key > $1.key})), id: \.key) { key, value in
                            HStack {
                                Text("\(key)")
                                    .frame(minWidth: 160, alignment: .leading)
                                Text(":")
                                Text("\(value ?? 0) cm")
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

struct SketsaSubSection_Previews: PreviewProvider {
    static var previews: some View {
        SketsaSubSection()
    }
}
