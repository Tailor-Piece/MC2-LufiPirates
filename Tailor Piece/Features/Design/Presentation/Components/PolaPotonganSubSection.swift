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

enum PolaCelanaTab {
    case banPinggang, depan, belakang
}

struct PolaPotonganSubSection: View {
    @State var polaPotonganCurrentTab: PolaPotonganTab = .bentukPakaian
    @State var polaCelanaTab: PolaCelanaTab = .banPinggang
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
                
                if desainViewModel.jenisPakaian == "Atasan" {
                    Picker("Hello", selection: $polaPotonganCurrentTab) {
                        Text("Bentuk Pakaian").tag(PolaPotonganTab.bentukPakaian)
                        Text("Lengan").tag(PolaPotonganTab.lengan)
                        Text("Leher").tag(PolaPotonganTab.leher)
                    }
                    .pickerStyle(.segmented)
                    
                    switch polaPotonganCurrentTab {
                    case .bentukPakaian:
                        Image("\(Array(self.desainViewModel.polaBentukPakaian.keys.sorted())[0])")
                            .resizable()
                            .frame(maxWidth: 436, maxHeight: 348)
                            .aspectRatio(contentMode: .fit)
                    case .lengan:
                        Image("\(Array(self.desainViewModel.polaLengan.keys.sorted())[0])")
                            .resizable()
                            .frame(maxWidth: 436, maxHeight: 348)
                            .aspectRatio(contentMode: .fit)
                    case .leher:
                        Image("\(Array(self.desainViewModel.polaLeher.keys.sorted())[0])")
                            .resizable()
                            .frame(maxWidth: 436, maxHeight: 348)
                            .aspectRatio(contentMode: .fit)
                    }
                } else {
                    Picker("Pola Celana", selection: $polaCelanaTab) {
                        Text("Ban Pinggang").tag(PolaCelanaTab.banPinggang)
                        Text("Depan").tag(PolaCelanaTab.depan)
                        Text("Belakang").tag(PolaCelanaTab.belakang)
                    }
                    .pickerStyle(.segmented)
                    
                    switch polaCelanaTab {
                    case .banPinggang:
                        Image("\(Array(self.desainViewModel.polaCelana.keys.sorted())[0])")
                            .resizable()
                            .frame(maxWidth: 436, maxHeight: 348)
                            .aspectRatio(contentMode: .fit)
                    case .depan:
                        Image("\(Array(self.desainViewModel.polaCelana.keys.sorted())[1])")
                            .resizable()
                            .frame(maxWidth: 436, maxHeight: 348)
                            .aspectRatio(contentMode: .fit)
                    case .belakang:
                        Image("\(Array(self.desainViewModel.polaCelana.keys.sorted())[2])")
                            .resizable()
                            .frame(maxWidth: 436, maxHeight: 348)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                
                VStack(spacing: 8) {
                    HStack{
                        Text("Detail Ukuran Pola")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        switch desainViewModel.jenisPakaian {
                        case "Atasan":
                            switch polaPotonganCurrentTab {
                            case .bentukPakaian:
                                let key = "\(Array(self.desainViewModel.polaBentukPakaian.keys.sorted())[0])"
                                ForEach(((desainViewModel.polaBentukPakaian[key] ?? [:]) ?? [:]).sorted(by: {$0.key < $1.key}), id: \.key) { key, value in
                                    HStack {
                                        Text("\(key)")
                                            .frame(minWidth: 160, alignment: .leading)
                                        Text(":")
                                        Text("\(value ?? 0)")
                                            .bold()
                                        Spacer()
                                    }
                                    .font(.caption)
                                }
                            case .lengan:
                                let key = "\(Array(self.desainViewModel.polaLengan.keys.sorted())[0])"
                                ForEach(((desainViewModel.polaLengan[key] ?? [:]) ?? [:]).sorted(by: {$0.key < $1.key}), id: \.key) { key, value in
                                    HStack {
                                        Text("\(key)")
                                            .frame(minWidth: 160, alignment: .leading)
                                        Text(":")
                                        Text("\(value ?? 0)")
                                            .bold()
                                        Spacer()
                                    }
                                    .font(.caption)
                                }
                            case .leher:
                                let key = "\(Array(self.desainViewModel.polaLeher.keys.sorted())[0])"
                                ForEach(((desainViewModel.polaLeher[key] ?? [:]) ?? [:]).sorted(by: {$0.key < $1.key}), id: \.key) { key, value in
                                    HStack {
                                        Text("\(key)")
                                            .frame(minWidth: 160, alignment: .leading)
                                        Text(":")
                                        Text("\(value ?? 0)")
                                            .bold()
                                        Spacer()
                                    }
                                    .font(.caption)
                                }
                            }
                        case "Bawahan":
                            switch polaCelanaTab {
                            case .banPinggang:
                                let key = "\(Array(self.desainViewModel.polaCelana.keys.sorted())[0])"
                                ForEach(((desainViewModel.polaCelana[key] ?? [:]) ?? [:]).sorted(by: {$0.key < $1.key}), id: \.key) { key, value in
                                    HStack {
                                        Text("\(key)")
                                            .frame(minWidth: 160, alignment: .leading)
                                        Text(":")
                                        Text("\(value ?? 0)")
                                            .bold()
                                        Spacer()
                                    }
                                    .font(.caption)
                                }
                            case .depan:
                                let key = "\(Array(self.desainViewModel.polaCelana.keys.sorted())[1])"
                                ForEach(((desainViewModel.polaCelana[key] ?? [:]) ?? [:]).sorted(by: {$0.key < $1.key}), id: \.key) { key, value in
                                    HStack {
                                        Text("\(key)")
                                            .frame(minWidth: 160, alignment: .leading)
                                        Text(":")
                                        Text("\(value ?? 0)")
                                            .bold()
                                        Spacer()
                                    }
                                    .font(.caption)
                                }
                            case .belakang:
                                let key = "\(Array(self.desainViewModel.polaCelana.keys.sorted())[2])"
                                ForEach(((desainViewModel.polaCelana[key] ?? [:]) ?? [:]).sorted(by: {$0.key < $1.key}), id: \.key) { key, value in
                                    HStack {
                                        Text("\(key)")
                                            .frame(minWidth: 160, alignment: .leading)
                                        Text(":")
                                        Text("\(value ?? 0)")
                                            .bold()
                                        Spacer()
                                    }
                                    .font(.caption)
                                }
                            }
                        default:
                            EmptyView()
                            
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
