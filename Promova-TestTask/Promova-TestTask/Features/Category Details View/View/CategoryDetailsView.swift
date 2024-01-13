//
//  CategoryDetailsView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import SwiftUI

struct CategoryDetailsView: View {
    // MARK: - View Model
    @StateObject var viewMdoel: CategoryDetailsViewModel

    // MARK: - Router
    @EnvironmentObject var router: Router

    var body: some View {
        VStack(spacing: Theme.Dimensions.marginExtraExtraLarge) {
            NavigationView(title: viewMdoel.categoryTitle, onBackAction: router.pop)
            ScrollView {
                ForEach(viewMdoel.factContent, id: \.self) { fact in
                    FactCardView(imageURL: fact.imageURL, factText: fact.fact)
                        .padding(.horizontal, Theme.Dimensions.marginMediumPlus)
                }
            }
            Spacer()
        }
        .background(Color(Theme.Colors.generalBgColor))
    }
}

#Preview {
    CategoryDetailsView(viewMdoel: CategoryDetailsViewModel(categoryTitle: "", factContent: [ContentItem(fact: "", image: "")]))
}
