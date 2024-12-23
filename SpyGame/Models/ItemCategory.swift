//
//  ItemCategory.swift
//  SpyGame
//
//  Created by amin on 12/23/24.
//


enum ItemCategory: Int, Hashable, CaseIterable {
    case allCategories
    case utility
    case city
}


extension ItemCategory {
    var localizedDescription: String {
        switch self {
        case .allCategories:
            return String(localized: "All Categories")
        case .utility:
            return String(localized: "Utility")
        case .city:
            return String(localized: "City")
        }
    }
}
