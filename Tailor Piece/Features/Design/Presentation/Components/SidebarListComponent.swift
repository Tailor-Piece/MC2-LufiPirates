//
//  SidebarListComponent.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 22/06/23.
//

import SwiftUI

struct SidebarListComponent: View {
    let tipeDesain: String
    let items: [String]
    let frameSize: CGSize
    let borderColor: Color
    let showCheckmark: Bool
    let checkMarkColor: Color
    let cornerRadius: CGFloat
    let fontSize: CGFloat
    let rowCount: Int
    
    @EnvironmentObject var desainViewModel:DesainViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: generateGridItems(), spacing: 16) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        ZStack {
                            VStack {
                                Image("Icon_\(getIconSVG(item: item))")
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
                                    .stroke(desainViewModel.tipeDesainChosen[self.tipeDesain] == item ? borderColor : ColorTheme.borderColor, lineWidth: 2)
                            )
                            .onTapGesture {
                                desainViewModel.tipeDesainChosen[self.tipeDesain] = item
                                changePolaPotongan()
                            }
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    
                                    if showCheckmark {
                                        Image(systemName: "checkmark.circle.fill")
                                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                                            .imageScale(.small)
                                            .foregroundColor(desainViewModel.tipeDesainChosen[self.tipeDesain] == item ? checkMarkColor : Color.clear)
                                    }
                                }
                            }
                        }
                        Text(item)
                            .font(.system(size: fontSize))
                    }
                }
            }
            .padding()
            .onAppear {
                changeSketsa()
//                changePolaPotongan()
            }
        }
    }
    
    private func generateGridItems() -> [GridItem] {
        var gridItems: [GridItem] = []
        for _ in 0..<rowCount {
            gridItems.append(GridItem(.fixed(frameSize.height)))
        }
        return gridItems
    }
    
    func changeSketsa() {
        let sketsa: [String]
        if(desainViewModel.jenisPakaian == "Atasan") {
            sketsa = desainViewModel.getSketsaAtasan(
                bentukPakaian: desainViewModel.tipeDesainChosen["Bentuk Pakaian"]!,
                lengan: desainViewModel.tipeDesainChosen["Lengan"]!,
                leher: desainViewModel.tipeDesainChosen["Leher"]!)
        } else {
            sketsa = desainViewModel.getSketsaBawahan(celana: desainViewModel.tipeDesainChosen["Celana"]!)
        }
        desainViewModel.tampakSketsa = ["tampakDepan":sketsa[0], "tampakBelakang":sketsa[1]]
    }
    
    func changePolaPotongan() {
        desainViewModel.setPola(ukuranBadan: desainViewModel.dictUkuranBadan)
    }
    
    func getIconSVG(item: String) -> String {
        if(item == "Classic Fit") {
            return "CF"
        } else if(item == "Modern Fit") {
            return "MF"
        } else if(item == "Slim Fit") {
            return "SF"
        } else if(item == "Long Sleeves") {
            return "LS"
        } else if(item == "3/4 Sleeves") {
            return "3-4Sl"
        } else if(item == "Short Sleeves") {
            return "SS"
        } else if(item == "Short Collar") {
            return "SC"
        } else if(item == "Cut-Away Collar") {
            return "CAC"
        } else if(item == "Classic Collar"){
            return "CC"
        } else if(item == "Loose Pants"){
            return "LP"
        } else if(item == "Relaxed Pants"){
            return "RP"
        } else {
            return "SP"
        }
    }

}

struct SidebarListComponent_Previews: PreviewProvider {
    
    static var previews: some View {
//        let filteredTypeClothing = filterByClothingType(clothingType: "Bentuk Pakaian")
        SidebarListComponent(
            tipeDesain: "bentukPakaian",
            items: ["Classic Fit", "Modern Fit", "Slim Fit"],
            frameSize: CGSize(width: 100, height: 100),
            borderColor: Color.blue,
            showCheckmark: true,
            checkMarkColor: ColorTheme.primary100,
            cornerRadius: 8,
            fontSize: 20,
            rowCount: 1
        )
    }
}
