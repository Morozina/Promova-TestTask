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

        /// Medium shadow opacity 30%
        static let mediumShadowOpacity: Double = 0.3

        /// Half shadow opacity 50%
        static let halfShadowOpacity: Double = 0.5

        /// Default border height: 3 px
        static let defaultBorderHeight: CGFloat = 3.0

        /// Medium icon size: 30 px
        static let mediumIconSize: CGSize = CGSize(width: 30, height: 30)

        /// Large icon size: 45 px
        static let largeIconSize: CGSize = CGSize(width: 45, height: 45)

        /// Loading animation Time Interval 0.3 sec
        static let loadingAnimationTimeInterval: TimeInterval = 0.3

        enum CategoryCard {
            static let imageSize: CGSize = CGSize(width: 121, height: 90)
            static let smallIconSize: CGSize = CGSize(width: 10, height: 12)
            static let maxCardHeight: CGFloat = 100
        }

        enum FactCard {
            static let maxCardHeight: CGFloat = 500
            static let imageHeight: CGFloat = 234
        }

        enum Dashboard {
            static let circleSize: CGSize = CGSize(width: 120, height: 120)
            static let offsetWhenCollapseStarted: CGFloat = 10.0
            static let circleRotationEffect: CGFloat = -90.0
            static let circleProgressDuration: TimeInterval = 2.0
        }
    }
}
