//
//  SpyGameManagerTests.swift
//  SpyGameTests
//
//  Created by amin on 12/23/24.
//

import Testing
@testable import SpyGame

struct SpyGameManagerTests {

    
    @Test func createInvalidSpyGame() throws {
        
        var gameManager : SpyGameManager? = nil
        #expect(throws: SpyGameError.numberOfSpiesShouleBeLessThanNumberOfPeople) {
            gameManager = try SpyGameManager(numberOfParticipants: 4, numberOfSpies: 4)
        }
        
        #expect(gameManager == nil)
        
    }
    
    @Test func createInvalidSpyGameWithZeroSpies() throws {
        
        var gameManager : SpyGameManager? = nil
        
        #expect(throws: SpyGameError.gameShouldHaveAtLeastOneSpy) {
            gameManager = try SpyGameManager(numberOfParticipants: 4, numberOfSpies: 0)
        }
        #expect(gameManager == nil)
    }
    
    
    
    @Test("Various arrangements of participants and spies", arguments: [
        (10, 1),
        (10, 5),
        (2, 1),
        (50, 10)
    ])  func generateSpyGameTester(participant: Int, spy: Int) {

        var spies = spy
        #expect(throws: Never.self) {
            let gameManager = try SpyGameManager(numberOfParticipants: participant, numberOfSpies: spies)
            
            for i in 0..<participant {
                let participant = try? gameManager.getParticipant(at: i)
                if participant == .spy {
                    spies -= 1
                }
            }
        }
        
        #expect(spies == 0)
    }
    
    

}
