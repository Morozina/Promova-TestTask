//
//  CategoryCardView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import SwiftUI

struct CategoryCardView: View {
    let imageURL: URL?
    let title: String
    let subTitle: String
    let type: CategoryStatusType
    let onAction: (() -> Void)?
    
    var body: some View {
        Button {
            onAction?()
        } label: {
            ZStack(alignment: .trailing) {
                HStack(spacing: Theme.Dimensions.marginMedium) {
                    ImageSection
                    TitleSection
                    Spacer()
                }
                .padding(.all, Theme.Dimensions.marginExtraSmall)
                .background(
                    RoundedRectangle(cornerRadius: Theme.Constants.defaultCornerRadius)
                        .fill(Color.white)
                        .shadow(color: .black.opacity(Theme.Constants.smallShadowOpacity), radius: Theme.Dimensions.marginMinimal, x: .zero, y: Theme.Dimensions.marginSmall)
                )
                ComingSoonSection
            }
            .padding(.horizontal, Theme.Dimensions.marginExtraMedium)
            .frame(maxHeight: Theme.Constants.CategoryCard.maxCardHeight)
        }
        .buttonStyle(.plain)
    }
    
    @ViewBuilder var ImageSection: some View {
        if let url = imageURL {
            AsyncImage(url: url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: Theme.Constants.CategoryCard.imageSize.width, height: Theme.Constants.CategoryCard.imageSize.height)
                        .clipped()
                }
            }
        }
    }
    
    @ViewBuilder var ComingSoonSection: some View {
        if type == .comingSoon {
            Image("coming-soon")
            RoundedRectangle(cornerRadius: Theme.Constants.defaultCornerRadius)
                .fill(.black.opacity(Theme.Constants.halfShadowOpacity))
        }
    }
    
    var TitleSection: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(title)
                .font(Theme.Fonts.medium16)
            Text(subTitle)
                .font(Theme.Fonts.medium12)
                .foregroundColor(Color(Theme.Colors.gray))
                .multilineTextAlignment(.leading)
            Spacer()
            if type == .paid {
                HStack(spacing: Theme.Dimensions.marginExtraExtraSmall) {
                    Image(systemName: "lock.fill")
                        .font(Theme.Fonts.medium12)
                        .foregroundColor(Color(Theme.Colors.midBlue))
                    Text("Premium")
                        .font(Theme.Fonts.medium16)
                        .foregroundColor(Color(Theme.Colors.midBlue))
                }
            }
        }
        .padding(.vertical, Theme.Dimensions.marginExtraSmall)
    }
}
