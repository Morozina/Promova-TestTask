//
//  Theme+Constants.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import Foundation

extension Theme {
    enum Constants {
        /// Default corner radius size
        static let defaultCornerRadius: CGFloat = 6

        /// Small shadow opacity 20%
        static let smallShadowOpacity: Double = 0.2

        /// Half shadow opacity 50%
        static let halfShadowOpacity: Double = 0.5

        /// Default border height: 3 px
        static let defaultBorderHeight: CGFloat = 3.0

        enum CategoryCard {
            static let imageSize: CGSize = CGSize(width: 121, height: 90)
            static let smallIconSize: CGSize = CGSize(width: 10, height: 12)
            static let maxCardHeight: CGFloat = 100
        }

        enum FactCard {
            static let imageSize: CGSize = CGSize(width: 315, height: 234)
            static let smallIconSize: CGSize = CGSize(width: 10, height: 12)
            static let maxCardHeight: CGFloat = 500
        }
    }
}
