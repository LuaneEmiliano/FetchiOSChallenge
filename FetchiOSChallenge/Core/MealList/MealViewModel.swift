//
//  MealViewModel.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal]?
    private let mealService: MealServiceProtocol
    
    init(mealService: MealServiceProtocol) {
        self.mealService = mealService
    }
    
    func fetchMeals(by category: Category) {
        Task {
            do {
                let fetchedMeals = try await mealService.fetchRecipes(by: category.rawValue)
                DispatchQueue.main.async {
                    self.meals = fetchedMeals
                }
            } catch {
                DispatchQueue.main.async {
                    print("Error fetching meals: \(error.localizedDescription)")
                }
            }
        }
    }
}
