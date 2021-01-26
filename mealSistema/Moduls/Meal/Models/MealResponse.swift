//
//  MealResponse.swift
//  mealSistema
//
//  Created by Aprizal on 26/1/21.
//

import Foundation

struct MealResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}
