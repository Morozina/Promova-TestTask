//
//  HostingView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import SwiftUI

struct HostingView: View {
    // MARK: - Router
    @StateObject var router = Router(root: .dashboard)

    var body: some View {
        RouterView(router: router) { path in
            switch path {
            case .dashboard:
                DashboardView(viewModel: DashboardViewModel())
            case .categoryDetails(let title, let content):
                CategoryDetailsView(viewModel: CategoryDetailsViewModel(categoryTitle: title, factContent: content))
            }
        }
    }
}

#Preview {
    HostingView()
}
