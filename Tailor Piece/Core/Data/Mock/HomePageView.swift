//
//  HomePageView.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 26/06/23.
//

import Foundation
import SwiftUI

struct HomePageView : View {
    
    @EnvironmentObject var homePageViewModel: HomePageViewModel
//    @StateObject var proyekViewModel = ProyekViewModel(proyek: nil)
    @State private var historyProyek:[ProyekModel] = []
    
    var body: some View {
        NavigationView {
            VStack {
                if homePageViewModel.isLoading {
                    ProgressView().progressViewStyle(.circular)
                } else {
                    NavigationLink("Buat Proyek") {
                        PilihJenisPakaianView()
//                                .environmentObject(proyekViewModel)
                    }
                    ForEach(historyProyek, id:\.self) { proyek in
                        Text(proyek.recordId?.recordName ?? "nil")
                    }
                }
            }
            .onAppear(){
                Task {
                    self.historyProyek = await homePageViewModel.initDataProyek()
                }
            }
        }
    }
}
