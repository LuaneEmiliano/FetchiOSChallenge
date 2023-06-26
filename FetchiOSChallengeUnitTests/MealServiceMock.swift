//
//  MealServiceMock.swift
//  FetchiOSChallengeUnitTests
//
//  Created by luane Niejelski on 6/25/23.
//

@testable import FetchiOSChallenge
import Foundation

class MealServiceMock: MealServiceProtocol {
    func fetchRecipes(by category: String) async throws -> [Meal] {
        return [Meal(id: "123", title: "Lasagna", thumbnail: "")]
    } 
}
