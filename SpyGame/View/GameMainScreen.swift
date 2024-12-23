//
//  GameMainScreen.swift
//  SpyGame
//
//  Created by amin on 12/23/24.
//

import SwiftUI

struct GameMainScreen: View {
    //MARK: Properties
    var gameManager : SpyGameManager
    @State var currentParticipantIndex: Int = 0 {
        didSet {
            isParticipantConfirmToView = false
        }
    }
    @State var isParticipantConfirmToView: Bool = false
    
    var getCurrentParticipantDescription: String {
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
    
    
    //MARK: Views
    var body: some View {
        
        VStack {
            Text("Participant no \(currentParticipantIndex + 1).")
                .font(.caption)
                
            if isParticipantConfirmToView {
                getCurrentParticipantMainView()
            } else {
                getConfirmationViewForThisParticipant()
            }
            /*
            HStack {
                Button("Previous") {
                    currentParticipantIndex -= 1
                }
                .disabled(currentParticipantIndex == 0)
                
                Text(getCurrentParticipantDescription)
                
                Button("Next") {
                    currentParticipantIndex += 1
                }
                .disabled((currentParticipantIndex + 1) == gameManager.numberOfParticipants)
            }*/
        }
        .padding()
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
        Button("Are you (as the participant no \(self.currentParticipantIndex + 1)) ready to see?") {
            self.isParticipantConfirmToView = true
        }
    }
    //MARK: o
}

#Preview {
    GameMainScreen(gameManager: .preview)
}
