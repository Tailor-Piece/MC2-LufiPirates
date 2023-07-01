////
////  HomePageView.swift
////  Tailor Piece
////
////  Created by Salsabila Zahra Chinanti on 26/06/23.
////
//
//import Foundation
//import SwiftUI
//
//struct HomePageView : View {
//    
//    @EnvironmentObject var homePageViewModel: HomePageViewModel
//    @State private var historyProyek:[ProyekModel] = []
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                if homePageViewModel.isLoading {
//                    ProgressView().progressViewStyle(.circular)
//                } else {
//                    NavigationLink("Buat Proyek") {
//                        PilihJenisPakaianView()
//                    }
//                    ForEach(historyProyek, id:\.self) { proyek in
//                        NavigationLink(proyek.namaProyek){
//                            HistoryView(proyek: proyek)
//                        }
//                    }
//                }
//            }
////            .onAppear(){
////                Task {
////                    self.historyProyek = await homePageViewModel.getDataProyek()
////                }
////            }
//        }
//    }
//}
