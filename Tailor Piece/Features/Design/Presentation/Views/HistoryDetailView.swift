//
//  HistoryDetailView.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 03/07/23.
//

import SwiftUI

struct HistoryDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var desainViewModel: DesainViewModel = DesainViewModel()
    @EnvironmentObject var router: Router

    var proyek: ProyekModel
    
    var body: some View {
        VStack(spacing: 0) {

            Divider()

            HStack(spacing: 20) {
                SketsaSubSectionHistory(proyekModel: proyek)
                    .environmentObject(desainViewModel)
                Divider()

                PolaPotonganSubSectionHistory(proyekModel: proyek)
                    .environmentObject(desainViewModel)
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("\(proyek.namaProyek)")
                    .bold()
                    .font(.headline)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("Batal")
                        .bold()
                }

            }
        }
        .onAppear(){
            desainViewModel.proyek = proyek
        }
    }
}



struct SketsaSubSectionHistory: View {
    @State var sketsaCurrentTab: SketsaTab = .tampakDepan
    @EnvironmentObject var router: Router
    @EnvironmentObject var desainViewModel: DesainViewModel
    var proyekModel: ProyekModel

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
//
                switch sketsaCurrentTab {
                case .tampakDepan:
                    Image("\(self.desainViewModel.tampakSketsa["tampakDepan"]!)")
                        .resizable()
                        .frame(maxWidth: 436, maxHeight: 348)
                        .aspectRatio(contentMode: .fit)
                case .tampakBelakang:
                    Image("\(self.desainViewModel.tampakSketsa["tampakBelakang"]!)")
                        .resizable()
                        .frame(maxWidth: 436, maxHeight: 348)
                        .aspectRatio(contentMode: .fit)
                }

                VStack(spacing: 8) {
                    HStack {
                        Text("Detail Ukuran Tubuh")
                            .font(.title3)
                            .bold()
                        Spacer()
                        .tint(.indigo)

                    }

                    VStack(alignment: .leading, spacing: 12) {
                        ForEach( ((proyekModel.ukuranBadan?.toDictionary(jenisPakaian: proyekModel.jenisPakaian).sorted(by: {$0.key > $1.key}))!), id: \.key) { key, value in
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
            .onAppear(){
                desainViewModel.proyek = proyekModel
                desainViewModel.changeSketsaHistory()
            }
        }
    }
}

struct PolaPotonganSubSectionHistory: View {
    @State var polaPotonganCurrentTab: PolaPotonganTab = .bentukPakaian
    @State var polaCelanaTab: PolaCelanaTab = .banPinggang
    @EnvironmentObject var desainViewModel: DesainViewModel
    var proyekModel: ProyekModel

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

                if proyekModel.jenisPakaian == "Atasan" {
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

                        switch proyekModel.jenisPakaian {
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
            .onAppear(){
                desainViewModel.proyek = proyekModel
                desainViewModel.changePolaPotonganHistory()
            }
        }

    }
}
