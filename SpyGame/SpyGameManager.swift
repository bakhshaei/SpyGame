//
//  SpyGameManager.swift
//  SpyGame
//
//  Created by amin on 12/23/24.
//

import Foundation


class SpyGameManager {
    //MARK: - Properties
    
    /// List of Items for selected Model
    //var itemList : Array<ItemModel> = []
    
    /// Selected Item for the specific round of game.
    private var selectedItem : ItemModel
    
    /// Total number of people participated in a game. (this also includes number of spies)
    private var numberOfParticipants : Int = 0
    
    /// Nubmer of Spies participated in a game.
    private var numberOfSpies : Int = 0
    
    /// And Instance of repository.
    private var itemRepository: SpyItemRepository = SpyItemRepository()
    
    private var participantArray : Array<ParticipantModel>? = nil
    
    
    //MARK: Initialization and Setup
    init(numberOfParticipants: Int, numberOfSpies: Int, fromCategory category: ItemCategory = .allCategories) throws {
        
        /// Validations:
        /// Check number of people and spies are valid.
        guard numberOfParticipants > numberOfSpies else {
            throw SpyGameError.numberOfSpiesShouleBeLessThanNumberOfPeople
        }
        guard numberOfSpies > 0 else {
            throw SpyGameError.gameShouldHaveAtLeastOneSpy
        }
        
        self.numberOfSpies = numberOfSpies
        self.numberOfParticipants = numberOfParticipants
        //itemList = itemRepository.fetchItems(for: category)
        self.selectedItem = itemRepository.getRandomItem()
    }
    
    
    //MARK: -
    private func generateParticipants() -> Array<ParticipantModel> {
        
        var addedSpies : Int = 0
        var wholeParticipants = Array.init(repeating: ParticipantModel.reguler, count: numberOfParticipants)
        
        while addedSpies < numberOfSpies {
            let i = Int.random(in: 0..<numberOfParticipants)
            if wholeParticipants[i] == .reguler {
                wholeParticipants[i] = .spy
                addedSpies += 1
            }
        }
        
        return wholeParticipants
    }
    
    func getParticipant(at index: Int) throws -> ParticipantModel {
        if participantArray == nil {
            participantArray = generateParticipants()
        }
        guard index < (participantArray?.count ?? 0) else {
            throw SpyGameError.invalidIndexForParticipant
        }
        
        return participantArray![index]
    }
    
}


enum SpyGameError: Error {
    case numberOfSpiesShouleBeLessThanNumberOfPeople
    case gameShouldHaveAtLeastOneSpy
    case invalidIndexForParticipant
}
