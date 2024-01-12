//
//  DashboardView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel: DashboardViewModel

    var body: some View {
        VStack {
            ForEach(viewModel.categories, id: \.self) { category in
                Text(category.title)
            }
        }
        .padding()
        .onAppear {
            Task {
                await viewModel.loadCategories()
            }
        }
    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel())
}
