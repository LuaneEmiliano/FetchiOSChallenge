//
//  MealViewModel.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var recipes: [Meal]?
    private let mealService: MealServiceProtocol
    
    init(mealService: MealServiceProtocol) {
        self.mealService = mealService
    }
    
    func fetchRecipes(by category: Category) {
        Task {
            do {
                let fetchedRecipes = try await mealService.fetchRecipes(by: category.rawValue)
                DispatchQueue.main.async {
                    self.recipes = fetchedRecipes
                }
            } catch {
                DispatchQueue.main.async {
                    print("Error fetching meals: \(error.localizedDescription)")
                }
            }
        }
    }
}
