//
//  ContentView.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 16/06/23.
//

import SwiftUI

struct DesignView: View {
    
    @StateObject var designViewModel = DesignViewModel()
    
    
    @EnvironmentObject var router: Router
    let filteredTypeClothing = filterByClothingType(clothingType: "Bentuk Pakaian")
    let filteredTypeSleeve = filterByClothingType(clothingType: "Lengan")
    let filteredTypeNeck = filterByClothingType(clothingType: "Leher")
    var body: some View {
        NavigationSplitView{
            List{
                Section(header: Text("Bentuk Pakaian")) {
                    SidebarListComponent(
                        items: filteredTypeClothing, frameSize: CGSize(width: 80, height: 70), borderColor: ColorTheme.primary100,  showCheckmark: true,checkMarkColor: ColorTheme.primary100,
                        cornerRadius: 8, fontSize: 11, rowCount: 1)
                }
                
                Section(header: Text("Panjang Lengan")) {
                    SidebarListComponent(items: filteredTypeSleeve, frameSize: CGSize(width: 80, height: 70), borderColor: ColorTheme.primary100,  showCheckmark: true,checkMarkColor: ColorTheme.primary100, cornerRadius: 8, fontSize: 11, rowCount: 1)
                }
                
                Section(header: Text("Leher")) {
                    SidebarListComponent(items: filteredTypeNeck, frameSize: CGSize(width: 80, height: 70), borderColor: ColorTheme.primary100,  showCheckmark: true, checkMarkColor: ColorTheme.primary100, cornerRadius: 8, fontSize: 11, rowCount: 1)
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
                    Text("Projek Tanpa Nama")
                        .bold()
                        .font(.headline)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("Batal clicked")
                    } label: {
                        Text("Batal")
                            .bold()
                    }
                    .cornerRadius(999)
                    
                    Button {
                        print("Simpan clicked")
                    } label: {
                        Text("Simpan")
                            .bold()
                    }
                    .cornerRadius(999)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .tint(.indigo)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DesignView()
            .environmentObject(Router())
    }
}



