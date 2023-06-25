//
//  MealListView.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import SwiftUI

enum Category: String {
    case dessert = "Dessert"
}

struct MealListView: View {
    @StateObject var viewModel = MealViewModel(mealService: MealService())
    @State var category: Category = .dessert
    
    var body: some View {
        VStack {
            if let recipes = viewModel.recipes {
                list(recipes: recipes)
            }
        }
        .onAppear {
            viewModel.fetchRecipes(by: .dessert)
        }
    }
    
    func list(recipes: [Meal]) -> some View {
        List(recipes) { recipe in
            NavigationLink {
                MealDetailView(mealId: recipe.id)
            } label: {
                HStack {
                    WebImageView(urlString: recipe.thumbnail)
                    Text(recipe.title)
                        .font(.headline)
                }
            }
            .navigationTitle("\(category.rawValue)s")
        }
    }
}

struct MeaListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MealListView()
        }
    }
}
