//
//  PilihJenisBajuPage.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 22/06/23.
//

import SwiftUI

struct PilihJenisBajuPage: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Pilih Jenis baju")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 8)
                .frame(maxWidth: 432)
                .aspectRatio(contentMode: .fit)
                .shimmer(ShimmerConfig(tint: .gray.opacity(0.3), highlight: .white))
            
            
        }
    }
}

struct PilihJenisBajuPage_Previews: PreviewProvider {
    static var previews: some View {
        SketsaSubSection()
    }
}
