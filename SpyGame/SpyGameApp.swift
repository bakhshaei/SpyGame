//
//  SpyGameApp.swift
//  SpyGame
//
//  Created by amin on 12/23/24.
//

import SwiftUI

@main
struct SpyGameApp: App {
    private let navigationModel: NavigationModel = .init()
    var body: some Scene {
        WindowGroup {
            switch navigationModel.currentRoute {
            case .newGame:
                ContentView()
            case .gameScreen(let gameScreen):
                GameMainScreen(gameManager: gameScreen)
            }
        }
        .environment(navigationModel)
    }
}
