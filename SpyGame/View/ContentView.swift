//
//  ContentView.swift
//  SpyGame
//
//  Created by amin on 12/23/24.
//

import SwiftUI

struct ContentView: View {
    @State var totalParticipantCounts: Int = 4
    @State var spyCounts: Int = 0
    @State var category: ItemCategory = .allCategories
    
    @State var errorsInterpreter: (occured: Bool, value: Error?) = (false, nil)
    
    @Environment(NavigationModel.self) private var navigationModel
    
    //MARK: Views
    var body: some View {
        @Bindable var navigationModel = navigationModel

        VStack {
            Form {
                /// Participants Picker
                Picker("Total Participants", selection: $totalParticipantCounts) {
                    ForEach(1..<21) { i in
                        Text(" \(i) person")
                    }
                }
                
                /// Spy number Picker
                Picker("Number of Spies:", selection: $spyCounts) {
                    ForEach(1..<20) { i in
                        Text(" \(i) person")
                    }
                }
                Text("It's recommended not to increase number of spies.")
                    .font(.caption2)
                    .padding(.bottom, 10)
                
                /// Category Picker
                Picker("Category", selection: $category) {
                    ForEach(ItemCategory.allCases, id: \.self) { category in
                        Text(category.localizedDescription)
                    }
                }
                
                Text("Perticipants: \(totalParticipantCounts + 1) | Spies: \(spyCounts + 1)")
                    .font(.caption)
            }
            .padding(.bottom, 60)
            .padding(.top, 15)
            
            Button("Start") {
                generateGame()
            }
        }
        .padding()
        .alert("Error", isPresented: $errorsInterpreter.occured) { /*actions*/ } message: {
            Text(errorsInterpreter.value?.localizedDescription ?? String(localized: "Unkown Error"))
        }
        .environment(navigationModel)

    }
    
    //MARK: Controller
    private func generateGame() {
        do {
            let newGame = try SpyGameManager(
                numberOfParticipants: totalParticipantCounts + 1,
                numberOfSpies: spyCounts + 1,
                fromCategory: category
            )
            
            navigationModel.currentRoute = .gameScreen(newGame)
            
        }
        catch {
            errorsInterpreter = (true, error)
        }
    }
}

#Preview {
    ContentView()
}



