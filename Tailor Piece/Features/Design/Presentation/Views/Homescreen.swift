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
    @StateObject var desainViewModel = DesainViewModel()
    @State private var isEditing: Bool = false
    @State private var text: String = "Editable Text"
    @FocusState private var focusedField: FocusedField?
    @State private var editedText: String = "Editable Text"
    
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
                ScrollView {
                    HStack(alignment: .top, spacing: 40) {
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
                            ForEach(1...4, id: \.self) { _ in
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 144, height: 144)
                                    .shimmer(ShimmerConfig(tint: .gray.opacity(0.2), highlight: .white))
                            }
                        } else {
                            ForEach(homePageViewModel.allProyek) { proyek in
                                NavigationLink {
                                    HistoryDetailView(router: _router, proyek: proyek)
                                } label: {
                                    VStack(alignment: .center){
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(Color.secondary, lineWidth: 1)
                                                .overlay(
                                                    Image("dummy-project-image")
                                                        .resizable()
                                                        .frame(width: 101, height: 101)
                                                        .aspectRatio(contentMode: .fit)
                                                )
                                            
                                        }
                                        .frame(width: 144, height: 144)
                                        Spacer().frame(height: 20)
                                        VStack (alignment: .center) {
                                            if isEditing {
                                                TextField("", text: $editedText,axis: .vertical)
                                                    .focused($focusedField, equals: .text)
                                                    .font(.system(size: 17))
                                                    .multilineTextAlignment(.center)
                                                    .padding()
                                                    .background(ColorTheme.secondary)
                                                    .lineLimit(3)
                                                    .frame(width: 144, height: 84)
                                                    .cornerRadius(4)
                                                    .disableAutocorrection(true)
                                                    .autocapitalization(.none)
                                                    .onChange(of: editedText) { newValue in
                                                        let filteredText = newValue.filter { $0 != "\n" }
                                                        editedText = filteredText
                                                        guard let newValueLastChar = newValue.last else { return }
                                                        if newValueLastChar == "\n" {
                                                            editedText.removeLast()
                                                            focusedField = nil
                                                            text = editedText
                                                            isEditing = false
                                                        }
                                                        if newValue.contains("\n"){
                                                            focusedField = nil
                                                            text = editedText
                                                            isEditing = false
                                                        }
                                                    }
                                            } else {
                                                Text(proyek.namaProyek)
                                                    .font(.system(size: 17))
                                                    .fontWeight(.regular)
                                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                                    .foregroundColor(.black)
                                                    .multilineTextAlignment(.center)
                                                    .onTapGesture {
                                                        focusedField = .text
                                                        editedText = text
                                                        isEditing = true
                                                    }
                                                
                                                
                                                Spacer()
                                            }
                                        }
                                        .frame(width: 144)
                                        
                                    }
                                    .frame(height: 250)
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
        .onTapGesture {
            focusedField = nil
            text = editedText
            isEditing = false
        }
        .onAppear {
            Task {
                await homePageViewModel.getDataProyek()
            }
        }
        
    }
    
}

struct HomescreenView_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen().environmentObject(Router())
            .previewInterfaceOrientation(.landscapeLeft)
        
    }
}
