//
//  TextFieldComponent.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 02/07/23.
//

import SwiftUI

struct TextFieldComponent: View {
    let proyek: ProyekModel
    @State var image: String
    @State var text: String
    
    @State var editedText: String = "Editable Text"
    @State var isEditing: Bool = false

    
    
    @FocusState var focusedField: FocusedField?
    
    var body: some View {
        // TODO: Bikin if dlu
        VStack(alignment: .center){
            ZStack{
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.secondary, lineWidth: 1)
                    .overlay(
                        Image("dummy-project-image")
                            .resizable()
                            .frame(width: 101, height: 101)
                            .aspectRatio(contentMode: .fit)
                    )

            }
            .frame(width: 144, height: 144)
            Spacer().frame(height: 20)
            VStack (alignment: .center) {
                if isEditing {
                    TextField("", text: $editedText, axis: .vertical)
                        .focused($focusedField, equals: .text)
                        .font(.system(size: 17))
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(ColorTheme.secondary)
                        .lineLimit(3)
                        .frame(width: 144, height: 84)
                        .cornerRadius(4)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .onSubmit {
                            editedText.removeLast()
                            focusedField = nil
                            text = editedText
                            isEditing = false
                        }
                } else {
                    Text(text)
                        .font(.system(size: 17))
                        .fontWeight(.regular)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .onTapGesture {
                            focusedField = .text
                            editedText = text
                            isEditing = true

                        }


                    Spacer()
                }
            }
            .frame(width: 144)
        }
        .frame(height: 250)
       
        
        
    }
}

//struct TextFieldComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldComponent()
//    }
//}
