//
//  Categories.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import Foundation

struct Categories: Codable, Hashable {
    var title: String
    var description: String
    var image: String
    var order: Int
    var status: String
    var content: [ContentItem]?

    struct ContentItem: Codable, Hashable {
        var fact: String
        var image: String
    }

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
