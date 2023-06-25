//
//  MealDetailService.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import Foundation

protocol MealDetailNetworkingServiceProtocol {
    func fetchMeal(mealId: String) async throws -> MealDetail
}

class MealDetailNetworkingService: MealDetailNetworkingServiceProtocol {
    func fetchMeal(mealId: String) async throws -> MealDetail {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else {
            throw NetworkingError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
            if let meal = response.meals?.first {
                return meal
            } else {
                throw NetworkingError.noData
            }
        } catch {
            throw error
        }
    }
}
