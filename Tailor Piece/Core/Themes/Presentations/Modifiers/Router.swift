//
//  Router.swift
//  Tailor Piece
//
//  Created by Muhammad Athif on 21/06/23.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func reset(){
        path = NavigationPath()
    }
}
