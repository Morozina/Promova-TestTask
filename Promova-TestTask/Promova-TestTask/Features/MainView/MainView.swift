//
//  MainView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import SwiftUI

@main
struct MainView: App {
    var body: some Scene {
        WindowGroup {
            DashboardView(viewModel: DashboardViewModel())
                .background(Color(Theme.Colors.generalBgColor))
        }
    }
}
