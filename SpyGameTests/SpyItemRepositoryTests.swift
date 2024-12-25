//
//  SpyItemRepositoryTests.swift
//  SpyGameTests
//
//  Created by amin on 12/23/24.
//

import Testing
@testable import SpyGame

struct SpyItemRepositoryTests {

    @Test func getRandomItemWithSpecificCategory() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let itemRepository = SpyItemRepository()
        
        for category in ItemCategory.allCases {
            if category == .allCategories { continue }
            #expect(itemRepository.getRandomItem(for: category).category == category)
        }
        
    }

}
