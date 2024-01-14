//
//  AppRoute.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import Foundation

enum AppRoute: Hashable {
    case dashboard
    case categoryDetails(String, [ContentItem])
}

extension AppRoute: Equatable {
    static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        switch (lhs, rhs) {
        case (.dashboard, .dashboard):
            return true
        case let (.categoryDetails(lhsTitle, lhsContentItems), .categoryDetails(rhsTitle, rhsContentItems)):
            return lhsTitle == rhsTitle && lhsContentItems == rhsContentItems
        default:
            return false
        }
    }
}
