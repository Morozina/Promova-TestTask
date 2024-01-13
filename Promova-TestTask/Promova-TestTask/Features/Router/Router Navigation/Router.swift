//
//  Router.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import SwiftUI

final class Router: ObservableObject {
    // MARK: - Root
    @Published var root: AppRoute

    // MARK: - Paths
    @Published var dashboardPath: [AppRoute] = []

    init(root: AppRoute) {
        self.root = root
    }

    // MARK: - Navigation Methods
    /// Method push new screen for view
    /// - Parameters:
    ///   - path:       app route destination to screen
    func push(to path: AppRoute) {
        dashboardPath.append(path)
    }

    /// Method to remove last screen from view
    func pop() {
        dashboardPath.removeLast()
    }
}
