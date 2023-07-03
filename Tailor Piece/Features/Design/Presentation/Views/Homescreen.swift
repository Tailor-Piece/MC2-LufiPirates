//
//  Homescreen.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 27/06/23.
//

import SwiftUI

struct Homescreen: View {
    @EnvironmentObject var router: Router
    @StateObject var homePageViewModel = HomePageViewModel()
    @StateObject var desainViewModel: DesainViewModel = DesainViewModel()
//    @State private var isEditing: Bool = false
//    @State private var text: String = "Editable Text"
//    @FocusState private var focusedField: FocusedField?
//    @State private var editedText: String = "Editable Text"
   
    let items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let itemsPerRow = 6
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 144))
    ]
    
    var body: some View {
        VStack{
            Spacer().frame(height: 57)
            Divider()
            VStack{
                Spacer().frame(height: 12)
                HStack{
                    Text("Proyek Terbaru")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    Spacer()
                    
                    
                }
                Spacer().frame(height: 38)
                ScrollView{
                    LazyVGrid(columns: adaptiveColumns, alignment: .center, spacing: 10){
                        Button {
                            router.path.append(0.0)
                        } label: {
                            VStack(alignment: .center){
                                ZStack{
                                    Image(systemName: "plus")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(.blue)
                                }.frame(width: 144, height: 144)
                                    .background(Color(red: 0.87, green: 0.87, blue: 1))
                                    .cornerRadius(4)
                                Spacer().frame(height: 20)
                                VStack (alignment: .center) {
                                    Text("Buat Project")
                                        .font(.system(size: 17))
                                        .fontWeight(.semibold)
                                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                        .foregroundColor(ColorTheme.primary100)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                .frame(width: 144)
                            }
                            .navigationDestination(for: Double.self, destination: { destination in
                                switch destination {
                                case 0.0: SelectJenisPakaianView().environmentObject(router)
                                        .environmentObject(desainViewModel)
                                case 1.0: InputUkuranBadanView().environmentObject(router)
                                        .environmentObject(desainViewModel)
                                case 2.0: DesignView().environmentObject(router)
                                        .environmentObject(desainViewModel)
                                default: EmptyView()
                                }
                            })
                            
                            .frame(height: 250)
                            
                        }
                        
                        if homePageViewModel.isLoading {
                            ForEach(1...8, id: \.self) { _ in
                                VStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 144, height: 144)
                                        .shimmer(ShimmerConfig(tint: .gray.opacity(0.2), highlight: .white))
                                    Spacer().frame(height: 106)
                                }
                            }
                        } else {
                            ForEach(homePageViewModel.allProyek) { proyek in
                                NavigationLink {
                                    HistoryDetailView(router: _router, proyek: proyek)
                                } label: {
                                    TextFieldComponent(proyek: proyek, image: "baju", text: proyek.namaProyek)
                                        .environmentObject(desainViewModel)
                                    
                                }

                            }
                        }
                        
                        
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 12, trailing: 0))
                }
                .refreshable {
                    Task {
                        await homePageViewModel.getDataProyek()
                    }
                }
                Spacer()
                
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight:0,
                maxHeight: .infinity
                
            )
            
            .background(Color.white)
            
        }
        .navigationBarBackButtonHidden(true)
      
        .onAppear {
            Task {
                await homePageViewModel.getDataProyek()
            }
        }
        
    }
    
    func generateGridRows<T>(items: [T], itemsPerRow: Int) -> [GridItem] {
        let rowCount = (items.count + itemsPerRow - 1) / itemsPerRow
        var gridRows = [GridItem]()
        
        for _ in 0..<rowCount {
            gridRows.append(GridItem(.flexible(), spacing: 80))
        }
        
        return gridRows
    }
    
}

struct HomescreenView_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen().environmentObject(Router())
            .previewInterfaceOrientation(.landscapeLeft)
        
    }
}
