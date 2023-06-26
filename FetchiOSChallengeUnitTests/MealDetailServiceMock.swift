//
//  MealDetailNetworkingServiceMock.swift
//  FetchiOSChallengeUnitTests
//
//  Created by luane Niejelski on 6/25/23.
//

import Foundation
@testable import FetchiOSChallenge

class MealDetailServiceMock: MealDetailServiceProtocol {
    func fetchMeal(mealId: String) async throws -> MealDetail {
        let mealDetail = MealDetail(
            id: "12345",
            name: "Spaghetti",
            category: "Pasta",
            area: "Italian",
            instructions: "Cook the spaghetti in boiling water. Add sauce.",
            thumbnail: URL(string: ""),
            ingredients: [
                Ingredient(id: "123", name: "Spaghetti", measure: "200g"),
                Ingredient(id: "456", name: "Pasta sauce", measure: "1 can")
            ]
        )
        return mealDetail
    }
}
