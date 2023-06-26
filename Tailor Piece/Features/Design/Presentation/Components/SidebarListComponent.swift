//
//  SidebarListComponent.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 22/06/23.
//

import SwiftUI

struct SidebarListComponent: View {
    let items: [MockDesignType]
    let frameSize: CGSize
    let borderColor: Color
    let showCheckmark: Bool
    let checkMarkColor: Color
    let cornerRadius: CGFloat
    let fontSize: CGFloat
    let rowCount: Int
    
    @State private var selectedItem: String? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: generateGridItems(), spacing: 16) {
                ForEach(items, id: \.name) { item in
                    VStack {
                        ZStack {
                            VStack {
                                Image(item.image)
                                    .resizable()
                                    .frame(
                                        width: 62,
                                        height: 62
                                    )
                                    .scaledToFit()
                            }
                            .frame(width: frameSize.width, height: frameSize.height)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(selectedItem == item.name ? borderColor : ColorTheme.borderColor, lineWidth: 2)
                            )
                            .onTapGesture {
                                selectedItem = selectedItem == item.name ? nil : item.name // Update selectedItem only if the current item is not selected or the same as the currently selected item
                            }
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    
                                    if showCheckmark {
                                        Image(systemName: "checkmark.circle.fill")
                                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                                            .imageScale(.small)
                                            .foregroundColor(selectedItem == item.name ? checkMarkColor : Color.clear)
                                    }
                                }
                            }
                        }
                        Text(item.name)
                            .font(.system(size: fontSize))
                    }
                }
            }
            .padding()
        }
    }
    
    private func generateGridItems() -> [GridItem] {
        var gridItems: [GridItem] = []
        for _ in 0..<rowCount {
            gridItems.append(GridItem(.fixed(frameSize.height)))
        }
        return gridItems
    }
}
