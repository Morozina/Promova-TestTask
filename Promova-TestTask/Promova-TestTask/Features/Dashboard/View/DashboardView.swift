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
            ScrollView {
                VStack(spacing: Theme.Dimensions.marginMediumVertical) {
                    ForEach(viewModel.categories, id: \.self) { item in
                        CategoryCardView(imageURL: item.imageURL, title: item.title, subTitle: item.description, type: item.type, onAction: nil)
                    }
                }
                .padding(.top, Theme.Dimensions.marginMediumVertical)
            }
        }
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
