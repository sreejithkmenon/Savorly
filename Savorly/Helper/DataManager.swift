//
//  DataManager.swift
//  Savorly
//
//  Created by Sreejith K Menon on 09/11/23.
//

import Foundation

/// `DataManager` is a singleton class responsible for managing data operations related to `MealDetail` and `MealList` objects in the Savorly application.
/// It provides functionality to parse and organize meal data effectively.
class DataManager {
    
    /// Shared instance of DataManager for singleton implementation.
    /// Ensures that data management is consistent and centralized throughout the application.
    static var shared = DataManager()
    
    /// Converts `MealDetail` object into an array of `Ingredients`.
    /// Each `Ingredients` object contains the name and measure of an ingredient.
    ///
    /// - Parameter meal: A `MealDetail` object containing details of a meal including ingredients and their measures.
    /// - Returns: An array of `Ingredients` objects, filtered to exclude any ingredients that are not specified (empty strings).
    func getIngredientsMeasureArr(meal: MealDetail) -> [Ingredients] {
        var ingredients = [Ingredients]()
        
        // The following lines create Ingredients objects for each ingredient in the meal.
        // It uses optional chaining with nil coalescing to handle potential nil values, ensuring the app doesn't crash due to missing data.
        // If an ingredient or its measure is nil, it defaults to an empty string.
        ingredients.append(Ingredients(id: 1, ingredient: meal.strIngredient1 ?? "", measure: meal.strMeasure1 ?? ""))
        ingredients.append(Ingredients(id: 2,ingredient: meal.strIngredient2 ?? "", measure: meal.strMeasure2 ?? ""))
        ingredients.append(Ingredients(id: 3,ingredient: meal.strIngredient3 ?? "", measure: meal.strMeasure3 ?? ""))
        ingredients.append(Ingredients(id: 4,ingredient: meal.strIngredient4 ?? "", measure: meal.strMeasure4 ?? ""))
        ingredients.append(Ingredients(id: 5,ingredient: meal.strIngredient5 ?? "", measure: meal.strMeasure5 ?? ""))
        ingredients.append(Ingredients(id: 6,ingredient: meal.strIngredient6 ?? "", measure: meal.strMeasure6 ?? ""))
        ingredients.append(Ingredients(id: 7,ingredient: meal.strIngredient7 ?? "", measure: meal.strMeasure7 ?? ""))
        ingredients.append(Ingredients(id: 8,ingredient: meal.strIngredient8 ?? "", measure: meal.strMeasure8 ?? ""))
        ingredients.append(Ingredients(id: 9,ingredient: meal.strIngredient9 ?? "", measure: meal.strMeasure9 ?? ""))
        ingredients.append(Ingredients(id: 10,ingredient: meal.strIngredient10 ?? "", measure: meal.strMeasure10 ?? ""))
        ingredients.append(Ingredients(id: 11,ingredient: meal.strIngredient11 ?? "", measure: meal.strMeasure11 ?? ""))
        ingredients.append(Ingredients(id: 12,ingredient: meal.strIngredient12 ?? "", measure: meal.strMeasure12 ?? ""))
        ingredients.append(Ingredients(id: 13,ingredient: meal.strIngredient13 ?? "", measure: meal.strMeasure13 ?? ""))
        ingredients.append(Ingredients(id: 14,ingredient: meal.strIngredient14 ?? "", measure: meal.strMeasure14 ?? ""))
        ingredients.append(Ingredients(id: 15,ingredient: meal.strIngredient15 ?? "", measure: meal.strMeasure15 ?? ""))
        ingredients.append(Ingredients(id: 16,ingredient: meal.strIngredient16 ?? "", measure: meal.strMeasure16 ?? ""))
        ingredients.append(Ingredients(id: 17,ingredient: meal.strIngredient17 ?? "", measure: meal.strMeasure17 ?? ""))
        ingredients.append(Ingredients(id: 18,ingredient: meal.strIngredient18 ?? "", measure: meal.strMeasure18 ?? ""))
        ingredients.append(Ingredients(id: 19,ingredient: meal.strIngredient19 ?? "", measure: meal.strMeasure19 ?? ""))
        ingredients.append(Ingredients(id: 20,ingredient: meal.strIngredient20 ?? "", measure: meal.strMeasure20 ?? ""))
        
        // Filters out any Ingredients objects that have an empty string for the ingredient.
        // This is to ensure that only valid ingredients are included in the returned array.
        let nonEmptyIngredients = ingredients.filter({ $0.ingredient != "" })
        
        return nonEmptyIngredients
    }
    
    /// Sorts and filters a list of `MealList` objects.
    /// The method first sorts the meals alphabetically by their names and then filters out any meals with empty names.
    ///
    /// - Parameter mealList: An array of `MealList` objects.
    /// - Returns: A sorted and filtered array of `MealList` objects, ensuring that only meals with valid names are included.
    func manageMealListData(mealList: [MealList]) -> [MealList] {
        var meals = [MealList]()
        
        // Sorts the meal list alphabetically by meal name.
        meals = mealList.sorted { $0.strMeal < $1.strMeal }
        
        // Filters out any MealList objects that have an empty string for the meal name.
        let nonEmptyMeals = meals.filter({ $0.strMeal != "" })
        
        return nonEmptyMeals
    }
}

// Note: The `MealDetail` and `MealList` structures are assumed to be defined elsewhere in the project.
// This class heavily relies on these structures for its functionality.
