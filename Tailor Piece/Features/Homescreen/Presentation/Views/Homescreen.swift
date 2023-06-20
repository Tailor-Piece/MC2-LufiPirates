//
//  ContentView.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 16/06/23.
//

import SwiftUI

struct Homescreen: View {
    
    @StateObject var homescreenViewModel = HomeScreenViewModel()
    
    var body: some View {
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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen()
    }
}



