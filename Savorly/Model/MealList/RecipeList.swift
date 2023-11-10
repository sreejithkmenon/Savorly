//
//  MealListObj.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

struct RecipeList: Codable {
    
    var mealListArr: [MealList]
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        mealListArr = try values.decode([MealList].self, forKey: .mealListArr)
    }
    
    init(mealListArr: [MealList]) {
        self.mealListArr = mealListArr
    }
    
    enum CodingKeys: String, CodingKey {
        case mealListArr = "meals"
    }
}
