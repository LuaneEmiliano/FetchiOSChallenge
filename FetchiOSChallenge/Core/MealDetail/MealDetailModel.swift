//
//  MealDetailModel.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import Foundation

struct MealDetail: Codable {
    let id: String
    let name: String?
    let category: String?
    let area: String?
    let instructions: String?
    let thumbnail: URL?
    let ingredients: [Ingredient]?
    
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        category = try container.decodeIfPresent(String.self, forKey: .category)
        area = try container.decodeIfPresent(String.self, forKey: .area)
        instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        thumbnail = try container.decodeIfPresent(URL.self, forKey: .thumbnail)
        
        ingredients = try MealDetail.decodeIngredients(from: decoder)
    }
    
    private static func decodeIngredients(from decoder: Decoder) throws -> [Ingredient] {
        var ingredients: [Ingredient] = []
        
        let container = try decoder.container(keyedBy: DynamicCodingKey.self)
        let ingredientKeys = container.allKeys.filter { $0.stringValue.hasPrefix("strIngredient") }
        let measureKeys = container.allKeys.filter { $0.stringValue.hasPrefix("strMeasure") }
        
        for ingredientKey in ingredientKeys {
            guard let ingredientName = try? container.decodeIfPresent(String.self, forKey: ingredientKey) else {
                continue
            }
            
            let measureKey = measureKeys.first { $0.stringValue == ingredientKey.stringValue.replacingOccurrences(of: "strIngredient", with: "strMeasure") }
            guard let ingredientMeasure = try? container.decodeIfPresent(String.self, forKey: measureKey!) else {
                continue
            }
            
            if !ingredientName.isEmpty && !ingredientMeasure.isEmpty {
                let ingredient = Ingredient(id: UUID().uuidString, name: ingredientName, measure: ingredientMeasure)
                ingredients.append(ingredient)
            }
        }
        return ingredients
    }
}

struct Ingredient: Codable, Identifiable {
    let id: String
    let name: String
    let measure: String
}

struct DynamicCodingKey: CodingKey, Comparable {
    var stringValue: String
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int? { return nil }
    init?(intValue: Int) { return nil }
    
    static func < (lhs: DynamicCodingKey, rhs: DynamicCodingKey) -> Bool {
        return lhs.stringValue < rhs.stringValue
    }
}


struct MealDetailResponse: Codable {
    let meals: [MealDetail]?
}
