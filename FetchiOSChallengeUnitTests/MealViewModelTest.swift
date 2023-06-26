//
//  MealViewModelTest.swift
//  FetchiOSChallengeUnitTests
//
//  Created by luane Niejelski on 6/25/23.
//

import XCTest
@testable import FetchiOSChallenge

final class MealViewModelTest: XCTestCase {
    var viewModel: MealViewModel!
    var mockMealService: MealServiceMock!
    
    override func setUp() {
        super.setUp()
        mockMealService = MealServiceMock()
        viewModel = MealViewModel(mealService: mockMealService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockMealService = nil
        super.tearDown()
    }
    
    func testFetchMeal() async {
        viewModel.fetchMeals(by: .dessert)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.viewModel.meals![0].id, "123")
            XCTAssertEqual(self.viewModel.meals![0].title, "Lasagna")
            XCTAssertEqual(self.viewModel.meals![0].thumbnail, "")
        }
    }
}

