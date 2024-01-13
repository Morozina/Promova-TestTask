//
//  ContentItem.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import Foundation

struct ContentItem: Codable, Hashable {
    var fact: String
    var image: String

    var imageURL: URL? {
        URL(string: image)
    }
}
