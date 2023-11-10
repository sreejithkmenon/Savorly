//
//  MealDetailObj.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

struct RecipeDetail: Codable {
    
    var mealDetailArr: [MealDetail]
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        mealDetailArr = try values.decode([MealDetail].self, forKey: .mealDetailArr)
    }
    
    init(mealDetailArr: [MealDetail]) {
        self.mealDetailArr = mealDetailArr
    }
    
    enum CodingKeys: String, CodingKey {
        case mealDetailArr = "meals"
    }
    
}
