//
//  Tailor_PieceApp.swift
//  Tailor Piece
//
//  Created by Sae Pasomba on 16/06/23.
//

import SwiftUI

@main
struct Tailor_PieceApp: App {
    @StateObject var router = Router()
    var body: some Scene {
        WindowGroup {
            Homescreen().environmentObject(router)
        }
    }
}
