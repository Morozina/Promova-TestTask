//
//  Categories.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import Foundation

struct Categories: Codable {
    var title: String
    var description: String
    var image: String
    var order: Int
    var status: String
    var content: [ContentItem]?
    
    var imageURL: URL? {
        URL(string: image)
    }

    var type: CategoryStatusType {
        guard !status.isEmpty else { return .comingSoon }
        
        return status == "paid" ? .paid : .free
    }
}

extension Categories: Hashable {
    static func == (lhs: Categories, rhs: Categories) -> Bool {
        // Assuming two instances are equal if all properties are equal
        lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.image == rhs.image &&
        lhs.order == rhs.order &&
        lhs.status == rhs.status &&
        lhs.content == rhs.content
    }
}
