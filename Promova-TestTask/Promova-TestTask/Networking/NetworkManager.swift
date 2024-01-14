//
//  NetworkManager.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import Foundation

protocol NetworkManager {
    func fetchCategories() async -> [Categories]?
}

final class NetworkManagerImpl: NetworkManager {
    func fetchCategories() async -> [Categories]? {
        do {
            let (data, _) = try await URLSession.shared.data(from: Config.URLs.categoriesURL)
            return try JSONDecoder().decode([Categories].self, from: data)
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}
