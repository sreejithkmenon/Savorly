//
//  DataMapper.swift
//  Savorly
//
//  Created by Sreejith K Menon on 09/11/23.
//

import Foundation

class DataMapper {
    
    static var shared = DataMapper()
    
    func getIngredientsMeasureArr(meal: MealDetail) -> [Ingredients] {
        var ingredients = [Ingredients]()
        
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
        
        //removes the empty ingredients
        let nonEmptyIngredients = ingredients.filter({
            $0.ingredient != ""
        })
        
        return nonEmptyIngredients
    }
    
    func sortMealListAlphabetically(mealList: [MealList]) -> [MealList] {
        var meals = [MealList]()
        meals = mealList.sorted { $0.strMeal < $1.strMeal }
        return meals
    }
    
}
