//
//  RootView.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 27/06/23.
//

import SwiftUI

struct RootView: View {
    // Ubah ke user default atau nyimpan ke app storage
    @State private var firstLogin = 1
    @EnvironmentObject var router: Router
    @State private var isOnBoarding = true
    var body: some View {
        NavigationStack(path: $router.path){
            ZStack{
                if isOnBoarding {
                    OnboardingView()
                }else{
                    Homescreen().environmentObject(router)
                }
               
            }.onAppear{
                // TODO: ubah pake user default
                if firstLogin == 1{
                    isOnBoarding = true
                }else{
                    isOnBoarding = false
                }
            }
        }
      
       
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(Router())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
