//
//  MealDetailObj.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

/// `RecipeDetail` is a structure that conforms to the `Codable` protocol, allowing it to be easily encoded and decoded from data formats like JSON.
/// It primarily represents a collection of meal details.
struct RecipeDetail: Codable {
    
    // MARK: - Properties
    /// `mealDetailArr` is an array of `MealDetail` objects, representing the details of various meals.
    var mealDetailArr: [MealDetail]
    
    // MARK: - Initializers
    
    /// Custom decoder initializer to decode data from a given decoder.
    /// It decodes an array of `MealDetail` from the provided `decoder`.
    /// - Parameter decoder: A decoder that provides a way for decoding `MealDetail` objects from an external representation (e.g., JSON).
    /// - Throws: An error if the data cannot be decoded.
    init(from decoder: Decoder) throws {
        // `values` is a container for the decoded data using the keys specified in `CodingKeys`.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decoding `mealDetailArr` from the decoder, using the key `.mealDetailArr`.
        // It expects an array of `MealDetail` objects.
        mealDetailArr = try values.decode([MealDetail].self, forKey: .mealDetailArr)
    }
    
    /// Designated initializer for manually creating a `RecipeDetail` instance.
    /// - Parameter mealDetailArr: An array of `MealDetail` objects to be assigned to `mealDetailArr`.
    init(mealDetailArr: [MealDetail]) {
        self.mealDetailArr = mealDetailArr
    }
    
    // MARK: - Coding Keys
    
    /// `CodingKeys` enumerates the keys used to encode and decode between the `RecipeDetail` and an external representation (e.g., JSON).
    /// `mealDetailArr` key is mapped to "meals" in the external representation.
    enum CodingKeys: String, CodingKey {
        case mealDetailArr = "meals"
    }
}
