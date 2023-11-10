//
//  MealListArr.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

/// `MealList` struct represents a meal entity with its associated properties.
/// It conforms to `Codable` for easy encoding and decoding from and to JSON,
/// and `Identifiable` which is useful in SwiftUI lists and other UI components.
struct MealList: Codable, Identifiable {
    // Properties of the MealList
    var id: String
    var strMeal: String
    var strMealThumb: String?
    
    /// Initializes a new instance from a decoder.
    /// This initializer is required for types conforming to `Decodable` and is used to decode JSON into `MealList` objects.
    ///
    /// - Parameter decoder: The decoder to read data from.
    /// - Throws: An error if decoding fails.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        strMeal = try values.decode(String.self, forKey: .strMeal)
        strMealThumb = try values.decode(String.self, forKey: .strMealThumb)
        id = try values.decode(String.self, forKey: .id)
    }
    
    /// Custom initializer for manually creating `MealList` instances.
    ///
    /// - Parameters:
    ///   - strMeal: The name of the meal.
    ///   - strMealThumb: URL string for the meal's thumbnail image.
    ///   - id: Unique identifier for the meal.
    init(strMeal: String, strMealThumb: String, id: String) {
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
        self.id = id
    }
    
    /// `CodingKeys` enum maps the JSON keys to the `MealList` properties.
    /// This allows for renaming properties in the Swift code while maintaining the JSON structure.
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strMealThumb
    }
    
    /// Provides a sample `MealList` instance for testing or placeholder purposes.
    ///
    /// - Returns: A `MealList` instance representing 'Apam balik'.
    static func example1() -> MealList {
        return MealList(strMeal: "Apam balik",
                        strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                        id: "1")
    }
    
    /// Provides another sample `MealList` instance for testing or placeholder purposes.
    ///
    /// - Returns: A `MealList` instance representing 'Apple & Blackberry Crumble'.
    static func example2() -> MealList {
        return MealList(strMeal: "Apple & Blackberry Crumble",
                        strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                        id: "2")
    }
}
