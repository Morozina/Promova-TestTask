//
//  DashboardViewModel.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import SwiftUI

final class DashboardViewModel: ObservableObject {
    // MARK: - Published
    @Published var categoryCardTitle: String = ""
    @Published var categoryCardConent: [ContentItem] = []
    @Published var categories: [Categories] = []
    @Published var categoryCardType: CategoryStatusType = .free
    @Published var shouldShowAlert: Bool = false
    @Published var shouldShowLoader: Bool = false
    @Published var isLoading: Bool = true
    @Published var circleProgress: Double = .zero

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

        // Sort the fetchedCategories based on the order property
        let sortedCategories = fetchedCategories.sorted(by: { $0.order < $1.order })

        // Switch to the main thread to update the UI
        DispatchQueue.main.async {
            self.categories = sortedCategories
            self.isLoading = false
        }
    }

    func handleAlertAction(with title: String, and content: [ContentItem], type: CategoryStatusType) {
        shouldShowAlert = true
        categoryCardTitle = title
        categoryCardConent = content
        categoryCardType = type
    }

    func handleShowAdAction(with router: Router) {
        withAnimation {
            shouldShowLoader = true
        }

        withAnimation(.easeInOut(duration: Theme.Constants.Dashboard.circleProgressDuration)) {
            circleProgress = 1
        }

        Timer.scheduledTimer(withTimeInterval: Theme.Constants.Dashboard.circleProgressDuration, repeats: false) { _ in
            withAnimation {
                self.shouldShowLoader = false
                self.circleProgress = .zero

                router.push(to: .categoryDetails(self.categoryCardTitle, self.categoryCardConent))
            }
        }
    }
}
