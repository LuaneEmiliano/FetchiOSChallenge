//
//  MealDetailViewModel.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    @Published var meal: MealDetail?
    private let mealDetailService: MealDetailNetworkingServiceProtocol
    
    init(mealDetailService: MealDetailNetworkingServiceProtocol) {
        self.mealDetailService = mealDetailService
    }
    
    func fetchMeal(mealId: String) {
        Task {
            do {
                let fetchedMeal = try await mealDetailService.fetchMeal(mealId: mealId)
                DispatchQueue.main.async {
                    self.meal = fetchedMeal
                }
            } catch {
                DispatchQueue.main.async {
                    print("Error fetching meal: \(error.localizedDescription)")
                }
            }
        }
    }
}
