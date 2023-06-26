//
//  MealDetailViewModelTest.swift
//  FetchiOSChallengeUnitTests
//
//  Created by luane Niejelski on 6/25/23.
//

import XCTest
@testable import FetchiOSChallenge

final class MealDetailViewModelTests: XCTestCase {
    var viewModel: MealDetailViewModel!
    var mockMealDetailService: MealDetailServiceMock!
    
    override func setUp() {
        super.setUp()
        mockMealDetailService = MealDetailServiceMock()
        viewModel = MealDetailViewModel(mealDetailService: mockMealDetailService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockMealDetailService = nil
        super.tearDown()
    }
    
    func testFetchMeal() async {
        let mealId = "12345"
        viewModel.fetchMeal(mealId: mealId)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertEqual(self.viewModel.meal!.id, mealId)
            XCTAssertEqual(self.viewModel.meal!.name, "Spaghetti")
            XCTAssertEqual(self.viewModel.meal!.category, "Pasta")
            XCTAssertEqual(self.viewModel.meal!.area, "Italian")
            XCTAssertEqual(self.viewModel.meal!.instructions, "Test Instructions")
            XCTAssertEqual(self.viewModel.meal!.ingredients?.count, 2)
        }
    }
}
