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
    
}
