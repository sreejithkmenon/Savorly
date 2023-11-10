//
//  AppConstants.swift
//  Savorly
//
//  Created by Sreejith K Menon on 09/11/23.
//

import Foundation

/// `AppConstants`: A struct containing constant values used throughout the application.
struct AppConstants {
    
    /// `App`: Constants specific to the application's general settings.
    struct App {
        // The name of the application.
        static let appName = "Savorly"
    }
    
    /// `URLs`: Constants related to the URLs used in the application.
    struct URLs {
        // URL to fetch the list of meals categorized as Dessert.
        static let getMealsListURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        // Base URL to fetch details of a meal by its ID.
        static let getMealByIDURL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    }
    
    /// `ErrorMessage`: Constants for error messages used in the application.
    struct ErrorMessage {
        // Generic error message prompting the user to try the operation again.
        static let tryAgainMessage = "Try again"
    }
    
    /// `UIUtils`: Constants used for defining UI elements and their properties.
    struct UIUtils {
        // Symbol used to indicate the absence of an image.
        static let noImageSymbol = "eye.slash.circle.fill"
        // Hexadecimal color value for the image border.
        static let imageBorderHexColor = "EEEEEE"
        
        // Titles for meal detail sections.
        static let instructionsMealTitle = "Instructions"
        static let ingredientsMealTitle = "Ingredients"
        // Symbol used to separate ingredients in the meal details.
        static let ingredientsMealSeparatorSymbol = "~"
        
        // UI dimensions and styles for meal list images.
        static let mealListRowImageSize = 100.0
        static let cachedAsyncImageMealListRowCornerRadius = 20.0
        static let cachedAsyncImageMealListRowCornerLineWidth = 1.0
        
        // UI dimensions and styles for extended meal detail images.
        static let mealDetailExtendedImageSize = 125.0
        static let cachedAsyncImageMealDetailCornerRadius = 20.0
        static let cachedAsyncImageMealDetailCornerLineWidth = 1.0
        
        // Padding settings for the meal details view.
        static let instructionsMealDetailTextPaddingTop = 1.0
        static let ingredientsMealDetailTitlePaddingBottom = 1.0
        
        // Size for the main image in the meal detail view.
        static let mealDetailImageSize = 300.0
    }
}

