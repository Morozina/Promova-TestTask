//
//  FactCardView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import SwiftUI

struct FactCardView: View {
    let imageURL: URL?
    let factText: String
    let leftChevronAction: (() -> Void)?
    let rightChevronAction: (() -> Void)?

    var body: some View {
        VStack(spacing: Theme.Dimensions.marginMedium) {
            ImageSection
            Text(factText)
                .font(Theme.Fonts.medium18)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            ButtonsSection
        }
        .padding(.all, Theme.Dimensions.defaultLayoutMargin)
        .frame(minHeight: Theme.Constants.FactCard.maxCardHeight)
        .background(
            RoundedRectangle(cornerRadius: Theme.Constants.defaultCornerRadius)
                .fill(Color.white)
                .shadow(color: .black.opacity(Theme.Constants.smallShadowOpacity), radius: Theme.Dimensions.marginMinimal, x: .zero, y: Theme.Dimensions.marginSmall)
        )
    }

    @ViewBuilder var ImageSection: some View {
        if let url = imageURL {
            AsyncImage(url: url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(height: Theme.Constants.FactCard.imageHeight)
                }
            }
        }
    }

    var ButtonsSection: some View {
        HStack(spacing: .zero) {
            Button {
                leftChevronAction?()
            } label: {
                Image(systemName: "chevron.left.circle")
                    .font(Theme.Fonts.light52)
                    .foregroundColor(.black)
            }
            Spacer()
            Button {
                rightChevronAction?()
            } label: {
                Image(systemName: "chevron.right.circle")
                    .font(Theme.Fonts.light52)
                    .foregroundColor(.black)
            }
        }
        .padding(.all, Theme.Dimensions.defaultLayoutMargin)
    }
}

#Preview {
    FactCardView(imageURL: URL(string: "https://cdn2.thecatapi.com/images/a94.jpg"), factText: "Cats have 32 muscles that control the outer ear (humans have only 6). A cat can independently rotate its ears 180 degrees.", leftChevronAction: nil, rightChevronAction: nil)
}
