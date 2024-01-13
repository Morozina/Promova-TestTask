//
//  NavigationView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import SwiftUI

struct NavigationView: View {
    // MARK: - Dependencies
    let title: String
    let onBackAction: (() -> Void)?

    // MARK: - View
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                Button {
                    onBackAction?()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .font(Theme.Fonts.medium17)
                }
                Spacer()
                Text(title)
                    .font(Theme.Fonts.medium17)
                Spacer()
            }
            .padding([.horizontal, .top], Theme.Dimensions.marginMediumHorizontal)
            .padding(.bottom, Theme.Dimensions.marginSemiLarge)
            Rectangle()
                .fill(Color(Theme.Colors.generalBgColor))
                .frame(height: Theme.Constants.defaultBorderHeight)
                .shadow(color: .black.opacity(Theme.Constants.halfShadowOpacity), radius: Theme.Dimensions.marginSmall, x: .zero, y: Theme.Dimensions.marginExtraExtraSmall)
        }
    }
}

#Preview {
    NavigationView(title: "Some Title", onBackAction: nil)
}
