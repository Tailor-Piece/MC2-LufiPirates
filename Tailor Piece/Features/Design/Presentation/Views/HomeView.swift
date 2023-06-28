//
//  ThirdView.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 21/06/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router
    
    @State var misc: [String: String] = ["abc": "GANTENG", "123": "GANTENG BANGET"]
    private let options = ["GANTENG", "GANTENG BANGET"]
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack{
                ForEach(Array(misc.keys), id: \.self) { key in
                    Picker("Select!", selection: $misc[key]) {
                        ForEach(0..<options.count, id: \.self) { index in
                            Text("\(options[index])").tag(options[index] as String?)
                        }
                    }

                }
            }
            .navigationDestination(for: String.self) { _ in
                SelectJenisPakaianView().environmentObject(router)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Router())
    }
}
