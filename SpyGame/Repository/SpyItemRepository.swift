//
//  SpyItemRepository.swift
//  SpyGame
//
//  Created by amin on 12/23/24.
//

import Foundation


class SpyItemRepository {
    func fetchItems(for category: ItemCategory) -> [ItemModel] {
        var items : Array<ItemModel> = [
            .init(category: .utility, name: String(localized: "Spyglass") ),
            .init(category: .utility, name: String(localized: "Microphone") ),
            .init(category: .utility, name: String(localized: "Radio") ),
            .init(category: .utility, name: String(localized: "Map") ),
            .init(category: .city, name: String(localized: "Los Angeles") )
        ]
        if category != .allCategories {
            
            items = items.filter({$0.category == category})
        }
        
        return items
    }
    
    public func getRandomItem(for category: ItemCategory = .allCategories) -> ItemModel {
        let itemList = self.fetchItems(for: category)
        let randomIndex = Int.random(in: 0..<itemList.count)
        return itemList[randomIndex]
    }
}



