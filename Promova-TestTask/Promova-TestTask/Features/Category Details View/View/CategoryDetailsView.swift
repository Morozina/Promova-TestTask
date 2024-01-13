//
//  CategoryDetailsView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import SwiftUI

struct CategoryDetailsView: View {
    // MARK: - Dependencies
    let title: String

    // MARK: - Router
    @EnvironmentObject var router: Router

    var body: some View {
        VStack(spacing: .zero) {
            NavigationView(title: title, onBackAction: router.pop)
            Spacer()
            Button {
                router.pop()
            } label: {
                Text("BACK")
            }
        }
        .background(Color(Theme.Colors.generalBgColor))
    }
}

#Preview {
    CategoryDetailsView(title: "")
}
