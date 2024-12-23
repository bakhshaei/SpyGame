//
//  NavigationModel.swift
//  SpyGame
//
//  Created by amin on 12/23/24.
//
import SwiftUI

@Observable
class NavigationModel {
    var currentRoute: Route = .newGame
}


enum Route {
    case newGame
    case gameScreen(SpyGameManager)
}
