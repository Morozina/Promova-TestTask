//
//  DashboardView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import SwiftUI

struct DashboardView: View {
    // MARK: - View Model
    @StateObject var viewModel: DashboardViewModel

    // MARK: - Router
    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: Theme.Dimensions.marginMediumVertical) {
                    ForEach(viewModel.categories, id: \.self) { item in
                        CategoryCardView(imageURL: item.imageURL, title: item.title, subTitle: item.description, type: item.type) {
                            router.push(to: .categoryDetails(item.title, item.content ?? []))
                        }
                    }
                }
                .padding(.top, Theme.Dimensions.marginMediumVertical)
            }
        }
        .background(Color(Theme.Colors.generalBgColor))
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
