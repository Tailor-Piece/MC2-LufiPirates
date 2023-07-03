//
//  RootView.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 27/06/23.
//

import SwiftUI

struct RootView: View {
    // Ubah ke user default atau nyimpan ke app storage
//    @State private var firstLogin = 1
    @EnvironmentObject var router: Router
//    @AppStorage("isOnBoarding") private var isOnBoarding = true
    
    var body: some View {
        NavigationStack(path: $router.path){
            VStack {
                if UserDefaults.standard.bool(forKey: "isOnBoarding") {
                    OnboardingView()
//                    UserDefaults.standard.set(false, forKey: "isOnBoarding")
                } else {
                    Homescreen().environmentObject(router)
                }
                
            }
        }
        .tint(.indigo)
        
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(Router())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
