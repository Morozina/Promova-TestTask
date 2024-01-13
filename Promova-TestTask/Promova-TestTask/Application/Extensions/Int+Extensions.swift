//
//  Int+Extensions.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import Foundation

extension Int {
    func increment(_ incrementRatio: Int = 1) -> Int {
        self + incrementRatio
    }

    func decrement(_ decrementRatio: Int = 1) -> Int {
        self - decrementRatio
    }
}
