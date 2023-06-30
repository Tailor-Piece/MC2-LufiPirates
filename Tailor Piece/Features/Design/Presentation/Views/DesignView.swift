//
//  ContentView.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 16/06/23.
//

import SwiftUI

struct DesignView: View {
    
    @StateObject var desainViewModel = DesainViewModel()
    
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        NavigationSplitView{
            List{
                Section(header: Text("Bentuk Pakaian")) {
                    SidebarListComponent(
                        items: desainViewModel.listBentukPakaian, frameSize: CGSize(width: 80, height: 70), borderColor: ColorTheme.primary100,  showCheckmark: true,checkMarkColor: ColorTheme.primary100,
                        cornerRadius: 8, fontSize: 11, rowCount: 1)
                }
                
                Section(header: Text("Panjang Lengan")) {
                    SidebarListComponent(items: desainViewModel.listLengan, frameSize: CGSize(width: 80, height: 70), borderColor: ColorTheme.primary100,  showCheckmark: true,checkMarkColor: ColorTheme.primary100, cornerRadius: 8, fontSize: 11, rowCount: 1)
                }
                
                Section(header: Text("Leher")) {
                    SidebarListComponent(items: desainViewModel.listLeher, frameSize: CGSize(width: 80, height: 70), borderColor: ColorTheme.primary100,  showCheckmark: true, checkMarkColor: ColorTheme.primary100, cornerRadius: 8, fontSize: 11, rowCount: 1)
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
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Projek Tanpa Nama")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DesignView()
            .environmentObject(Router())
    }
}


