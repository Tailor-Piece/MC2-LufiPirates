//
//  HomePageViewModel.swift
//  Tailor Piece
//
//  Created by Salsabila Zahra Chinanti on 27/06/23.
//

import Foundation
import CloudKit

//store ProyekModels
class HomePageViewModel: ObservableObject {
    @Published var allProyek: [ProyekModel] = []
    @Published var isLoading = false
    
    private let proyekRepository = ProyekRepository()
}

extension HomePageViewModel {
    func getDataProyek() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        if let allProyek = try? await proyekRepository.getAllProyek(completion: {
            results in
                switch results {
                case .success(_):
                    DispatchQueue.main.async {
                        self.isLoading = false
                        print("Success")
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print("Error: \(error)")
                        self.isLoading = false
                    }
                }
        }){
            DispatchQueue.main.async {
                self.isLoading = false
                self.allProyek = allProyek
            }
        }
    }
}
