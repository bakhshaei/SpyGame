//
//  GameMainScreen.swift
//  SpyGame
//
//  Created by amin on 12/23/24.
//

import SwiftUI

struct GameMainScreen: View {
    //MARK: Properties
    
    /// Instance of Game Manager for each round.
    var gameManager : SpyGameManager
    
    /// A boolean value to show the if the current Participant ready (and comfirmed) to view its related message.
    @State private var isParticipantConfirmToView: Bool = false

    /// Index of current participant.
    @State private var currentParticipantIndex: Int = 0 {
        didSet {
            isParticipantConfirmToView = false
        }
    }
    
    /// Message related to the current participant (tied up to currentParticipantIndex).
    private var getCurrentParticipantDescription: String {
        let participantRole = try? gameManager.getParticipant(at: currentParticipantIndex)
        switch participantRole {
        case .reguler:
            return gameManager.selectedItem.name
            
        case .spy:
            return String(localized: "Spy")
        
        case .none:
            return ""
        }
    }
    
    /// Navigation model.
    @Environment(NavigationModel.self) private var navigationModel
    
    @State private var showNewGameAlert: Bool = false
    
    //MARK: Views
    var body: some View {
        @Bindable var navigationModel = navigationModel
        
        VStack {
            HStack {
                Spacer()
                Button(String(localized: "Start New Game")) {
                    showNewGameAlert = true
                }
            }
            Spacer()
            
            Text("Participant no \(currentParticipantIndex + 1).")
                .font(.caption)
                .padding(.bottom, 18)
                
            if isParticipantConfirmToView {
                getCurrentParticipantMainView()
            } else {
                getConfirmationViewForThisParticipant()
            }
            
            
            Spacer()
        }
        .padding()
        .alert("New Game", isPresented: $showNewGameAlert) {
            Button("Yes") {
                navigationModel.currentRoute = .newGame
            }
            Button("No") {
                showNewGameAlert = false
            }
        } message: {
            Text("Are you sure to start a new game?")
        }

        //.alert("New Game", isPresented: $showNewGameAlert, presenting: nil) { _ in }
    }
    
    @ViewBuilder
    func getCurrentParticipantMainView() -> some View {
        
        HStack {
            Button("Previous Participant") {
                currentParticipantIndex -= 1
                
            }
            .disabled(currentParticipantIndex == 0)
            
            Spacer()
            
            Text(getCurrentParticipantDescription)
            
            Spacer()

            Button("Next Participant") {
                currentParticipantIndex += 1
            }
            .disabled((currentParticipantIndex + 1) == gameManager.numberOfParticipants)
        }
        
    }
    
    @ViewBuilder
    func getConfirmationViewForThisParticipant() -> some View {
        Button("Are you (as the participant no \(self.currentParticipantIndex + 1)) ready to see your card?") {
            self.isParticipantConfirmToView = true
        }
    }
    //MARK: o
}

#Preview {
        GameMainScreen(gameManager: .preview)
            .environment(NavigationModel())
}
