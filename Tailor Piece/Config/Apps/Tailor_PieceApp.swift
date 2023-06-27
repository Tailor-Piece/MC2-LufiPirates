//
//  Tailor_PieceApp.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 16/06/23.
//

import SwiftUI
import CloudKit

@main
struct Tailor_PieceApp: App {
    
//    //public container
//    let container = CKContainer(identifier: "iCloud.com.salsaachinanti.TailorPiece")
    @StateObject var router = Router()
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(router)
        }
    }
//    var body: some Scene {
//        WindowGroup {
//            TestView(vm: OrderListViewModel(container: container))
//        }
//    }
}
