//
//  CategoryDetailsViewModel.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import Foundation

final class CategoryDetailsViewModel: ObservableObject {
    // MARK: - Dependencies
    let categoryTitle: String
    let factContent: [ContentItem]

    // MARK: - Initialization
    init(categoryTitle: String, factContent: [ContentItem]) {
        self.categoryTitle = categoryTitle
        self.factContent = factContent
    }
}
