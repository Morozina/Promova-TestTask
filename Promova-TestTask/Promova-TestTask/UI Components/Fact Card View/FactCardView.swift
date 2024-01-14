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
        VStack(spacing: .zero) {
            ImageSection
            Text(factText)
                .font(Theme.Fonts.medium18)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(Theme.Constants.halfShadowOpacity)
                .padding(.top, Theme.Dimensions.marginMedium)
            Spacer()
            ButtonsSection
        }
        .padding(.all, Theme.Dimensions.defaultLayoutMargin)
        .frame(maxHeight: Theme.Constants.FactCard.maxCardHeight)
        .background(
            RoundedRectangle(cornerRadius: Theme.Constants.defaultCornerRadius)
                .fill(Color.white)
                .shadow(color: .black.opacity(Theme.Constants.mediumShadowOpacity), radius: Theme.Dimensions.marginSemiLarge, x: .zero, y: Theme.Dimensions.marginMediumPlus)
        )
    }

    @ViewBuilder var ImageSection: some View {
        if let url = imageURL {
            CacheAsyncImage(url: url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(height: Theme.Constants.FactCard.imageHeight)
                } else {
                    Color.white
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
            if let imageURL {
                ShareLink("", item: imageURL, message: Text(factText))
                    .font(Theme.Fonts.light52)
                    .foregroundColor(.black)
                    .padding([.leading, .bottom], Theme.Dimensions.defaultLayoutMargin)
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
