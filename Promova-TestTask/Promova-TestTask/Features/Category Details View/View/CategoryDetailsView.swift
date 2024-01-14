//
//  CategoryDetailsView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import SwiftUI

struct CategoryDetailsView: View {
    // MARK: - View Model
    @StateObject var viewModel: CategoryDetailsViewModel

    // MARK: - Router
    @EnvironmentObject var router: Router

    var body: some View {
        VStack(spacing: Theme.Dimensions.marginExtraExtraLarge) {
            NavigationView(title: viewModel.categoryTitle, onBackAction: router.pop)
            TabView(selection: $viewModel.selectedItem) {
                ForEach(viewModel.factContent.indices, id: \.self) { index in
                    FactCardView(imageURL: viewModel.factContent[index].imageURL, factText: viewModel.factContent[index].fact) {
                        viewModel.chevronAction(for: index, and: .left)
                    } rightChevronAction: {
                        viewModel.chevronAction(for: index, and: .right)
                    }
                    .padding(.horizontal, Theme.Dimensions.marginMediumPlus)
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.default, value: viewModel.selectedItem)
            Spacer()
        }
        .background(Color(Theme.Colors.generalBgColor))
    }
}

#Preview {
    CategoryDetailsView(viewModel: CategoryDetailsViewModel(categoryTitle: "", factContent: [ContentItem(fact: "", image: "")]))
}
