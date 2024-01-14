//
//  ImageCache.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 14/01/2024.
//

import SwiftUI

class ImageCache {
    static private var cache: [URL: Image] = [:]

    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
