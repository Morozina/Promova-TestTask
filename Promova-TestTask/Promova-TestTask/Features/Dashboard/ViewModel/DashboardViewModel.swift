//
//  DashboardViewModel.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    // MARK: - Published
    @Published var categories: [Categories] = []

    // MARK: - Dependencies
    private let networkManager: NetworkManager

    // MARK: - Initialization
    init(networkManager: NetworkManager = NetworkManagerImpl()) {
        self.networkManager = networkManager
    }

    // MARK: - Not private methods
    func loadCategories() async {
        // Fetch categories
        let fetchedCategories: [Categories]? = await networkManager.fetchCategoriesAsync()

        // Make sure that fetchedCategories != nil else return from func
        guard let fetchedCategories else { return }

        // Switch to the main thread to update the UI
        DispatchQueue.main.async {
            self.categories = fetchedCategories
        }
    }
}
