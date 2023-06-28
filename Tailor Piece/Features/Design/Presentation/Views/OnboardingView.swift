//
//  OnboardingView.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 27/06/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
            VStack{
                Spacer().frame(height: 49)
                Image("icon-tailor")
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer().frame(height: 83)
                HStack{
                    Image("opening-image-1")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Image("opening-image-2")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Image("opening-image-3")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                Spacer().frame(height: 83)
                Text("Tentukan Pola Pakaian Mudah dan Akurat")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer().frame(height: 20)
                Text("Ukur secara akurat dan ciptakan pakaian yang indah")
                    .font(.system(size: 28))
                    .foregroundColor(ColorTheme.secondaryText.opacity(0.6))
                    .kerning(-0.4 * 0.75)
                
                Spacer().frame(height: 52)
                ButtonComponent(
                    text: "Mulai",
                    textColor: .white,
                    frameSize: CGSize(width: 357, height: 50),
                    frameColor: ColorTheme.primary100,
                    isButtonFullWidth: false,
                    cornerRadius: 12,
                    fontSize: 18,
                    action: {
                        print("Button tapped")
                    },
                    targetView: Homescreen()
                )
        }
       
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView().previewInterfaceOrientation(.landscapeLeft)
    }
}
