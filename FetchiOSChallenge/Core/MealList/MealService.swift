//
//  MealService.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import Foundation

protocol MealServiceProtocol {
    func fetchRecipes(by category: String) async throws -> [Meal]
}

class MealService: MealServiceProtocol {
    func fetchRecipes(by category: String) async throws -> [Meal] {
        let baseURL = "https://themealdb.com/api/json/v1/1/"
        guard let url = URL(string: baseURL + "filter.php?c=\(category)") else {
            throw NetworkingError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let response = try JSONDecoder().decode([String: [Meal]].self, from: data)
            let meals = response["meals"] ?? []
            return meals
        } catch {
            throw error
        }
    }
}
