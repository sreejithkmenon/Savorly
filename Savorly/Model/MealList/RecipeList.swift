//
//  MealListObj.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

/// `RecipeList` is a structure for decoding and storing a list of meals.
/// It conforms to the `Codable` protocol to facilitate easy decoding from JSON data.
struct RecipeList: Codable {
    
    // MARK: - Properties
    /// An array of `MealList` objects representing individual meals in the list.
    var mealListArr: [MealList]
    
    // MARK: - Initializers
    /// Initializes a new instance of `RecipeList` from a decoder.
    /// This initializer is used for decoding JSON data into `RecipeList` objects.
    /// - Parameter decoder: The `Decoder` to read data from.
    /// - Throws: An error if decoding fails.
    init(from decoder: Decoder) throws {
        // Defines a container keyed by the defined coding keys to access the data.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decodes the array of `MealList` from the JSON data.
        mealListArr = try values.decode([MealList].self, forKey: .mealListArr)
    }
    
    /// Initializes a new instance of `RecipeList` with a given array of `MealList`.
    /// This initializer can be used to create a `RecipeList` object directly from an array of `MealList` objects.
    /// - Parameter mealListArr: An array of `MealList` objects.
    init(mealListArr: [MealList]) {
        self.mealListArr = mealListArr
    }
    
    // MARK: - CodingKeys
    /// Enumeration defining the keys used in the coding process.
    /// This is used to map JSON keys to the corresponding properties of `RecipeList`.
    enum CodingKeys: String, CodingKey {
        case mealListArr = "meals"
    }
}
