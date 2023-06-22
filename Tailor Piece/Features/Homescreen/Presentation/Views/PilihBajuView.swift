//
//  PilihBajuView.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 22/06/23.
//

import Foundation
import SwiftUI

struct PilihBajuView : View {
    
    @State private var selectedItem: String? = nil
    var types : [String] = ["Atasan", "Bawahan"]

    var body: some View {
        
        VStack{
            HStack {
                Text("Pilih Jenis Baju")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding(.bottom, 100)
            
            HStack(alignment: .center, spacing: 33){
                ForEach(types, id:\.self) {type in
                    ZStack{
                        VStack(alignment: .center, spacing: 36) {
                            Image(type)
                                .resizable()
                                .frame(width: 216, height: 216, alignment: Alignment.center)
                            Text(type)
                                .foregroundColor(selectedItem == type ? Color.indigo : Color.black)
                        }
                        .padding(24)
                        .frame(width: 264, height: 328, alignment: .top)
                        .cornerRadius(22.5)
                        .onTapGesture {
                            selectedItem = selectedItem == type ? nil : type
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 22.5)
                                .inset(by: 1.5)
                                .stroke(selectedItem == type ? Color.indigo : Color.gray.opacity(0.5))
                        )
                        
                        // MARK: SHOW CHECKMARK
                        if selectedItem != nil {
                            Image(systemName: "checkmark.circle.fill")
                                .padding(EdgeInsets(top: 92, leading: 65, bottom: 0, trailing: 0))
                                .scaleEffect(2.5)
                                .foregroundColor(selectedItem == type ? Color.indigo : Color.clear)
                                .zIndex(1)
                        }
                    }
                }
                
            }
        }
        .padding()
    }
}

struct Previews_PilihBajuView_Previews: PreviewProvider {
    static var previews: some View {
        PilihBajuView()
    }
}
