//
//  Ingredients.swift
//  Savorly
//
//  Created by Sreejith K Menon on 09/11/23.
//

import Foundation

/// `Ingredients` is a struct representing a cooking ingredient with its associated measurement.
/// It conforms to the `Identifiable` protocol, which is useful for identifying elements in a collection,
/// especially when using SwiftUI. This struct can be used in a broader context of a recipe application
/// or any other application that deals with ingredients and their measurements.
struct Ingredients: Identifiable {
    // MARK: - Properties
    
    /// Unique identifier for each ingredient.
    /// Assumption: `id` is assumed to be unique for each `Ingredients` instance.
    /// This is crucial for distinguishing between different instances, especially in a list or a collection view.
    var id: Int
    
    /// Name of the ingredient.
    /// It's a string that holds the name of the ingredient. For example, "Sugar", "Salt".
    /// Default value is an empty string, indicating that it can be initialized without a specific ingredient name.
    var ingredient: String = ""
    
    /// Measurement of the ingredient.
    /// It's a string that holds the measure of the ingredient, such as "1 cup", "2 tablespoons".
    /// Default value is an empty string, similar to `ingredient`, allowing initialization without a predefined measure.
    var measure: String = ""
    
    // MARK: - Initializer
    
    /// Initializes a new ingredient with the specified properties.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the ingredient. Must be unique across all instances.
    ///   - ingredient: A string representing the name of the ingredient.
    ///   - measure: A string representing the measurement of the ingredient.
    ///
    /// - Returns: An instance of `Ingredients` with the provided id, ingredient name, and measure.
    init(id:Int, ingredient: String, measure: String) {
        self.id = id
        self.ingredient = ingredient
        self.measure = measure
    }
}

