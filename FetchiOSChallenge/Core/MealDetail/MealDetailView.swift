//
//  MealDetailView.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import SwiftUI

struct MealDetailView: View {
    @ObservedObject var viewModel = MealDetailViewModel(mealDetailService: MealDetailService())
    let mealId: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if let meal = viewModel.meal {
                VStack(alignment: .leading, spacing: 8) {
                    AsyncImageView(url: meal.thumbnail)
                    InstructionsView(instructions: meal.instructions)
                    IngredientsView(ingredients: meal.ingredients)
                }
                .padding()
            } else {
                ProgressView()
            }
        }
        .navigationTitle(viewModel.meal?.name ?? "")
        .onAppear {
            viewModel.fetchMeal(mealId: mealId)
        }
    }
}

private struct InstructionsView: View {
    let instructions: String?
    
    var body: some View {
        if let instructions = instructions {
            VStack(alignment: .leading, spacing: 4) {
                Text("Instructions")
                    .font(.headline)
                Text(instructions)
                    .font(.body)
            }
            .padding(.top, 1)
        }
    }
}

private struct IngredientsView: View {
    let ingredients: [Ingredient]?
    
    var body: some View {
        if let ingredients = ingredients {
            VStack(alignment: .leading, spacing: 4) {
                Text("Ingredients")
                    .font(.headline)
                ForEach(ingredients) { ingredient in
                    Text("\(ingredient.name): \(ingredient.measure)")
                }
            }
            .padding(.top, 3)
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealId: "53049")
    }
}
