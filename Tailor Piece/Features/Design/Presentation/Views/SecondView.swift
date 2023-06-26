//
//  SecondView.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 21/06/23.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack{
            Text("Welcome to second view")
            Button(action: {
                  router.path.append(2)
              }) {
                  Text("Go to page 3")
              }
            
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
