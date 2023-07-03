//
//  ButtonComponent.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 23/06/23.
//

import SwiftUI

struct ButtonComponent<Content: View>: View {
    let text: String
    let textColor: Color
    let frameSize: CGSize
    let frameColor: Color
    let isButtonFullWidth: Bool
    let cornerRadius: CGFloat
    let fontSize: CGFloat
    let action: () -> Void
    let targetView: Content
    
    @State var isTargetViewPresented: Bool = false
    
    
    var body: some View {
        if (!isButtonFullWidth){
            VStack{
                Button{
                    // TODO: Tambahkan aksi
                    
                    action()
                    isTargetViewPresented = true
                } label: {
                    ZStack{
                        RoundedRectangle(
                            cornerRadius: cornerRadius)
                        .fill(frameColor)
                        .frame(width: frameSize.width, height: frameSize.height)
                        VStack{
                            Text(text)
                                .font(.system(size: fontSize))
                                .foregroundColor(textColor)
                                .padding()
                        }
                        .frame(width: frameSize.width, height: frameSize.height)
                    }
                }
                .navigationDestination(isPresented: $isTargetViewPresented){
                    // TODO: Tambahkan target view
                    targetView
                }
            }
        }else{
            VStack{
                Button{
                    // TODO: Tambahkan aksi
                    action()
                    isTargetViewPresented = true
                } label: {
                    ZStack{
                        RoundedRectangle(
                            cornerRadius: cornerRadius)
                        .fill(frameColor)
                        .frame(width: .infinity, height: frameSize.height)
                        VStack{
                            Text(text)
                                .font(.system(size: fontSize))
                                .foregroundColor(textColor)
                                .padding()
                        }
                        .frame(width: .infinity, height: frameSize.height)
                        
                        
                    }
                }
                .navigationDestination(isPresented: $isTargetViewPresented){
                    // TODO: Tambahkan target view
                    targetView
                }
            }
        }
       
        
        
        
        
        
    }
}

//struct ButtonComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonComponent(
//            text: "Press me",
//            textColor: .white,
//            frameSize: CGSize(width: 200, height: 50),
//            frameColor: .blue,
//            isButtonFullWidth: false,
//            cornerRadius: 10,
//            fontSize: 18,
//            action: {
//                print("Button tapped")
//            },
//            targetView: InputUkuranBadanView()
//        )
//    }
//}
