//
//  MealListArr.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

struct MealList: Codable, Identifiable {
    var id: String
    var strMeal: String
    var strMealThumb: String?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        strMeal = try values.decode(String.self, forKey: .strMeal)
        strMealThumb = try values.decode(String.self, forKey: .strMealThumb)
        id = try values.decode(String.self, forKey: .id)
    }
    
    init(strMeal: String, strMealThumb: String, id: String) {
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strMealThumb
    }
    
    static func example1() -> MealList {
        return MealList(strMeal: "Apam balik",
                           strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                           id: "1")
    }
    
    static func example2() -> MealList {
        return MealList(strMeal: "Apple & Blackberry Crumble",
                           strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                           id: "2")
    }
}
