//
//  ContentView.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 16/06/23.
//

import SwiftUI

struct Homescreen: View {
    
    @StateObject var homescreenViewModel = HomeScreenViewModel()
    
    
    @EnvironmentObject var router: Router
    var body: some View {
        NavigationSplitView{
            List{
                
                Section(header: Text("Bentuk Pakaian")) {
                    SidebarListComponent(
                        items: mockClothingForm.map { MockListItem(name: $0.name, image: $0.image).name }, frameSize: CGSize(width: 80, height: 70), borderColor: ColorTheme.primary100,  showCheckmark: true,checkMarkColor: ColorTheme.primary100,
                                         cornerRadius: 8, fontSize: 11, rowCount: 1)
                }
                
                Section(header: Text("Panjang Lengan")) {
                    SidebarListComponent(items: mockSleeveForm.map { MockListItem(name: $0.name, image: $0.image).name }, frameSize: CGSize(width: 80, height: 70), borderColor: ColorTheme.primary100,  showCheckmark: true,checkMarkColor: ColorTheme.primary100, cornerRadius: 8, fontSize: 11, rowCount: 1)
                }
                
                Section(header: Text("Leher")) {
                    SidebarListComponent(items: mockNeckForm.map { MockListItem(name: $0.name, image: $0.image).name }, frameSize: CGSize(width: 80, height: 70), borderColor: ColorTheme.primary100,  showCheckmark: true, checkMarkColor: ColorTheme.primary100, cornerRadius: 8, fontSize: 11, rowCount: 1)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Tipe Desain")
        }detail: {
            Text("test")
            NavigationStack (path: $router.path){
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Sang Penguasa UI/UX")
                    Text("\(homescreenViewModel.message ?? "Ea")")
                        .opacity(0)
                        .font(.largeTitle)
                        .bold()
                        .fontWidth(.expanded)
                        .overlay {
                            LinearGradient(colors: [.blue, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
                                .mask {
                                    Text("\(homescreenViewModel.message ?? "Ea")")
                                        .font(.largeTitle)
                                        .bold()
                                        .fontWidth(.expanded)
                                }
                        }
                    
                    Text("Test Shimmer")
                        .bold()
                        .font(.largeTitle)
                        .shimmer(ShimmerConfig(tint: .white.opacity(0.2), highlight: .white))
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.red.gradient)
                        }
                    
                    VStack {
                        HStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(height: 20)
                            RoundedRectangle(cornerRadius: 15)
                                .frame(height: 20)
                            RoundedRectangle(cornerRadius: 15)
                                .frame(height: 20)
                        }
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 20)
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 20)
                    }
                    .shimmer(ShimmerConfig(tint: .gray.opacity(0.2), highlight: .white))
                    
                    Button(action: {
                        router.path.append(1)
                    }) {
                        Text("Go to page 2")
                    }
                    .navigationDestination(for: Int.self){ destination in
                        switch destination {
                        case 1:
                            SecondView().environmentObject(router)
                        case 2:
                            ThirdView().environmentObject(router)
                        default:
                            EmptyView()
                        }
                        
                    }
                }
                .padding()
            }
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen()
            .environmentObject(Router())
    }
}



