//
//  AppConstants.swift
//  Savorly
//
//  Created by Sreejith K Menon on 09/11/23.
//

import Foundation

struct AppConstants {
    
    struct App {
        static let appName = "Savorly"
    }
    
    struct URLs {
        static let getMealsListURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        static let getMealByIDURL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    }
    
    struct ErrorMessage {
        static let tryAgainMessage = "Try again"
    }
    
    struct UIUtils {
        static let noImageSymbol = "eye.slash.circle.fill"
        static let imageBorderHexColor = "EEEEEE"
        
        static let instructionsMealTitle = "Instructions"
        static let ingredientsMealTitle = "Ingredients"
        static let ingredientsMealSeparatorSymbol = "~"
        
        static let mealListRowImageSize = 100.0
        static let cachedAsyncImageMealListRowCornerRadius = 20.0
        static let cachedAsyncImageMealListRowCornerLineWidth = 1.0
        
        static let mealDetailExtendedImageSize = 125.0
        static let cachedAsyncImageMealDetailCornerRadius = 20.0
        static let cachedAsyncImageMealDetailCornerLineWidth = 1.0
        
        static let instructionsMealDetailTextPaddingTop = 1.0
        
        static let ingredientsMealDetailTitlePaddingBottom = 1.0
        
        static let mealDetailImageSize = 300.0
    }
}
