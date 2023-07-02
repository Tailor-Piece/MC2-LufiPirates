//
//  ContentView.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 16/06/23.
//

import SwiftUI

struct DesignView: View {
    
    @EnvironmentObject var desainViewModel: DesainViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        NavigationSplitView{
            List{
                ForEach((desainViewModel.dictTipeDesain[desainViewModel.jenisPakaian ?? "Bawahan"] ?? [:]).sorted(by: {$0.key > $1.key}), id: \.key) { key, value in
                    
                    Section(header: Text("\(key)")) {
                        SidebarListComponent(
                            tipeDesain: key, items: value, frameSize: CGSize(width: 80, height: 70), borderColor: ColorTheme.primary100,  showCheckmark: true,checkMarkColor: ColorTheme.primary100,
                            cornerRadius: 8, fontSize: 11, rowCount: 1)
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Tipe Desain")
        } detail: {
            VStack(spacing: 0) {
                Divider()
                
                HStack(spacing: 20) {
                    SketsaSubSection()
                    
                    Divider()
                    
                    PolaPotonganSubSection()
                }
                .padding(.horizontal, 20)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Projek Tanpa Judul")
                        .bold()
                        .font(.headline)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        router.reset()
                    } label: {
                        Text("Batal")
                            .bold()
                    }
                    .cornerRadius(999)
                    
                    Button {
                        Task {
                            await desainViewModel.saveUkuranBadan()
                            await desainViewModel.saveTipeDesain()
                            await desainViewModel.saveSketsa()
                            await desainViewModel.saveFinalProyek()
                        }
                        router.reset()
                    } label: {
                        Text("Simpan")
                            .bold()
                    }
                    .cornerRadius(999)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DesignView()
            .environmentObject(Router())
    }
}



