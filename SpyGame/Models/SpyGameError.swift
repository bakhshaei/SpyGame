//
//  Untitled.swift
//  SpyGame
//
//  Created by amin on 12/23/24.
//


import Foundation.NSError

enum SpyGameError: LocalizedError {
    case numberOfSpiesShouleBeLessThanNumberOfPeople
    case gameShouldHaveAtLeastOneSpy
    case invalidIndexForParticipant
}

extension SpyGameError {
    var errorDescription: String? {
        switch self {
        case .numberOfSpiesShouleBeLessThanNumberOfPeople:
            return String(localized:"Number of spies should be less than number of participants")
        case .gameShouldHaveAtLeastOneSpy:
            return String(localized: "Game should have at least one spy")
        case .invalidIndexForParticipant:
            return String(localized: "Invalid index for participant")
        }
    }
}
