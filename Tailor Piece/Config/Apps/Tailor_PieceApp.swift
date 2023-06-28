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

    //public container
    let container = CKContainer(identifier: "iCloud.com.salsaachinanti.TailorPiece")
    @StateObject var homePageViewModel = HomePageViewModel()


//    @StateObject var router = Router()
//    var body: some Scene {
//        WindowGroup {
//            Homescreen().environmentObject(router)
//        }
//    }
    var body: some Scene {
        WindowGroup {
            HomePageView()
                .environmentObject(homePageViewModel)
        }
    }
}

//import SwiftUI
//import CloudKit
//
//@main
//struct Tailor_PieceApp: App {
////    var container = CKContainer(identifier: "iCloud.com.salsaachinanti.TailorPiece")
//    @State private var isUserLoggedIn: Bool = false
//    @StateObject private var model = DesignViewModel(container:CKContainer(identifier: "iCloud.com.salsaachinanti.TailorPiece"))
//    @Environment(\.scenePhase) var scenePhase
//
//    var body: some Scene {
//        WindowGroup {
//            Group {
//                if isUserLoggedIn {
//                    DesignView()
//                        .environmentObject(model)
//                } else {
//                    ErrorView(errorWrapper: ErrorWrapper(error: UserAccountError.notSignedIn, guidance: "Please sign in to iCloud.")) {
//                        Button("Open settings") {
//                            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
//                            Task {
//                                if UIApplication.shared.canOpenURL(settingsUrl) {
//                                    let _ = await UIApplication.shared.open(settingsUrl)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            .onChange(of: scenePhase, perform: { newPhase in
//                if newPhase == .active {
//                    Task {
//                        isUserLoggedIn = (try? await model.checkUserLoginToiCloud()) ?? false
//                    }
//                }
//            })
//        }
//    }
//}
