//
//  CategoryDetailsViewModel.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import Foundation

final class CategoryDetailsViewModel: ObservableObject {
    // MARK: - Published
    @Published var selectedItem: Int = .zero

    // MARK: - Dependencies
    let categoryTitle: String
    let factContent: [ContentItem]

    // MARK: - Initialization
    init(categoryTitle: String, factContent: [ContentItem]) {
        self.categoryTitle = categoryTitle
        self.factContent = factContent
    }

    // MARK: - Not private method
    func chevronAction(for index: Int, and duration: CategoryCevronModel) {
        switch duration {
        case .left:
            if selectedItem > .zero {
                selectedItem = index.decrement()
            }
        case .right:
            if selectedItem < factContent.count - 1 {
                selectedItem = index.increment()
            }
        }
    }
}
