//
//  ThirdView.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 21/06/23.
//

import SwiftUI

struct ThirdView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack{
            Text("Welcome to third view")
            Button(action: {
                router.reset()
            }) {
                Text("Go back to root view")
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
