//
//  MealDetailArr.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

struct MealDetail: Codable, Identifiable {
    
    var id: String
    var strMeal: String?
    var strInstructions: String?
    var strMealThumb: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        strMeal = try values.decode(String.self, forKey: .strMeal)
        strInstructions = try values.decode(String.self, forKey: .strInstructions)
        strMealThumb = try values.decodeIfPresent(String.self, forKey: .strMealThumb)
        strIngredient1 = try values.decodeIfPresent(String.self, forKey: .strIngredient1)
        strIngredient2 = try values.decodeIfPresent(String.self, forKey: .strIngredient2)
        strIngredient3 = try values.decodeIfPresent(String.self, forKey: .strIngredient3)
        strIngredient4 = try values.decodeIfPresent(String.self, forKey: .strIngredient4)
        strIngredient5 = try values.decodeIfPresent(String.self, forKey: .strIngredient5)
        strIngredient6 = try values.decodeIfPresent(String.self, forKey: .strIngredient6)
        strIngredient7 = try values.decodeIfPresent(String.self, forKey: .strIngredient7)
        strIngredient8 = try values.decodeIfPresent(String.self, forKey: .strIngredient8)
        strIngredient9 = try values.decodeIfPresent(String.self, forKey: .strIngredient9)
        strIngredient10 = try values.decodeIfPresent(String.self, forKey: .strIngredient10)
        strIngredient11 = try values.decodeIfPresent(String.self, forKey: .strIngredient11)
        strIngredient12 = try values.decodeIfPresent(String.self, forKey: .strIngredient12)
        strIngredient13 = try values.decodeIfPresent(String.self, forKey: .strIngredient13)
        strIngredient14 = try values.decodeIfPresent(String.self, forKey: .strIngredient14)
        strIngredient15 = try values.decodeIfPresent(String.self, forKey: .strIngredient15)
        strIngredient16 = try values.decodeIfPresent(String.self, forKey: .strIngredient16)
        strIngredient17 = try values.decodeIfPresent(String.self, forKey: .strIngredient17)
        strIngredient18 = try values.decodeIfPresent(String.self, forKey: .strIngredient18)
        strIngredient19 = try values.decodeIfPresent(String.self, forKey: .strIngredient19)
        strIngredient20 = try values.decodeIfPresent(String.self, forKey: .strIngredient20)
        strMeasure1 = try values.decodeIfPresent(String.self, forKey: .strMeasure1)
        strMeasure2 = try values.decodeIfPresent(String.self, forKey: .strMeasure2)
        strMeasure3 = try values.decodeIfPresent(String.self, forKey: .strMeasure3)
        strMeasure4 = try values.decodeIfPresent(String.self, forKey: .strMeasure4)
        strMeasure5 = try values.decodeIfPresent(String.self, forKey: .strMeasure5)
        strMeasure6 = try values.decodeIfPresent(String.self, forKey: .strMeasure6)
        strMeasure7 = try values.decodeIfPresent(String.self, forKey: .strMeasure7)
        strMeasure8 = try values.decodeIfPresent(String.self, forKey: .strMeasure8)
        strMeasure9 = try values.decodeIfPresent(String.self, forKey: .strMeasure9)
        strMeasure10 = try values.decodeIfPresent(String.self, forKey: .strMeasure10)
        strMeasure11 = try values.decodeIfPresent(String.self, forKey: .strMeasure11)
        strMeasure12 = try values.decodeIfPresent(String.self, forKey: .strMeasure12)
        strMeasure13 = try values.decodeIfPresent(String.self, forKey: .strMeasure13)
        strMeasure14 = try values.decodeIfPresent(String.self, forKey: .strMeasure14)
        strMeasure15 = try values.decodeIfPresent(String.self, forKey: .strMeasure15)
        strMeasure16 = try values.decodeIfPresent(String.self, forKey: .strMeasure16)
        strMeasure17 = try values.decodeIfPresent(String.self, forKey: .strMeasure17)
        strMeasure18 = try values.decodeIfPresent(String.self, forKey: .strMeasure18)
        strMeasure19 = try values.decodeIfPresent(String.self, forKey: .strMeasure19)
        strMeasure20 = try values.decodeIfPresent(String.self, forKey: .strMeasure20)
    }
    
    init(id: String, strMeal: String, strInstructions: String, strMealThumb: String, strIngredient1: String, strIngredient2: String, strIngredient3: String, strIngredient4: String, strIngredient5: String, strIngredient6: String, strIngredient7: String, strIngredient8: String, strIngredient9: String, strIngredient10: String, strIngredient11: String, strIngredient12: String, strIngredient13: String, strIngredient14: String, strIngredient15: String, strIngredient16: String, strIngredient17: String, strIngredient18: String, strIngredient19: String, strIngredient20: String, strMeasure1: String, strMeasure2: String, strMeasure3: String, strMeasure4: String, strMeasure5: String, strMeasure6: String, strMeasure7: String, strMeasure8: String, strMeasure9: String, strMeasure10: String, strMeasure11: String, strMeasure12: String, strMeasure13: String, strMeasure14: String, strMeasure15: String, strMeasure16: String, strMeasure17: String, strMeasure18: String, strMeasure19: String, strMeasure20: String) {
        
        self.id = id
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
        self.strInstructions = strInstructions
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strIngredient9 = strIngredient9
        self.strIngredient10 = strIngredient10
        self.strIngredient11 = strIngredient11
        self.strIngredient12 = strIngredient12
        self.strIngredient13 = strIngredient13
        self.strIngredient14 = strIngredient14
        self.strIngredient15 = strIngredient15
        self.strIngredient16 = strIngredient16
        self.strIngredient17 = strIngredient17
        self.strIngredient18 = strIngredient18
        self.strIngredient19 = strIngredient19
        self.strIngredient20 = strIngredient20
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strMeasure9 = strMeasure9
        self.strMeasure10 = strMeasure10
        self.strMeasure11 = strMeasure11
        self.strMeasure12 = strMeasure12
        self.strMeasure13 = strMeasure13
        self.strMeasure14 = strMeasure14
        self.strMeasure15 = strMeasure15
        self.strMeasure16 = strMeasure16
        self.strMeasure17 = strMeasure17
        self.strMeasure18 = strMeasure18
        self.strMeasure19 = strMeasure19
        self.strMeasure20 = strMeasure20
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strInstructions
        case strMealThumb
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }
    
    static func example1() -> MealDetail {
        return MealDetail(id: "1", strMeal: "Teriyaki Chicken Casserole", strInstructions: "Preheat oven to 35000b0 F. Spray a 9x13-inch baking pan with non-stick spray.nCombine soy sauce, 00bd cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\r\n*Meanwhile, steam or cook the vegetables according to package directions.\r\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!", strMealThumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg", strIngredient1:"soy sauce", strIngredient2:"water", strIngredient3:"brown sugar", strIngredient4:"ground ginger", strIngredient5:"minced garlic", strIngredient6:"cornstarch", strIngredient7:"chicken breasts", strIngredient8:"stir-fry vegetables", strIngredient9:"brown rice", strIngredient10:"", strIngredient11:"", strIngredient12:"", strIngredient13:"", strIngredient14:"", strIngredient15:"", strIngredient16:"null", strIngredient17:"null", strIngredient18:"null", strIngredient19:"null", strIngredient20:"null", strMeasure1:"34 cup",strMeasure2:"1/2 cup", strMeasure3:"1/4 cup",strMeasure4:"1/2 teaspoon",strMeasure5:"12 teaspoon", strMeasure6:"4 Tablespoons",strMeasure7:"2", strMeasure8:"1 (12 oz.)", strMeasure9:"3 cups", strMeasure10:"", strMeasure11:"",strMeasure12:"",strMeasure13:"", strMeasure14:"", strMeasure15:"", strMeasure16:"null", strMeasure17:"null", strMeasure18:"null", strMeasure19:"null", strMeasure20:"null")
    }
    
    static func example2() -> MealDetail {
        return MealDetail(id: "2", strMeal: "Beef", strInstructions : "Enjoy!", strMealThumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg", strIngredient1:"soy sauce", strIngredient2:"water", strIngredient3:"brown sugar", strIngredient4:"ground ginger", strIngredient5:"minced garlic", strIngredient6:"cornstarch", strIngredient7:"chicken breasts", strIngredient8:"stir-fry vegetables", strIngredient9:"brown rice", strIngredient10:"", strIngredient11:"", strIngredient12:"", strIngredient13:"", strIngredient14:"", strIngredient15:"", strIngredient16:"null", strIngredient17:"null", strIngredient18:"null", strIngredient19:"null", strIngredient20:"null", strMeasure1:"34 cup",strMeasure2:"1/2 cup", strMeasure3:"1/4 cup",strMeasure4:"1/2 teaspoon",strMeasure5:"12 teaspoon", strMeasure6:"4 Tablespoons",strMeasure7:"2", strMeasure8:"1 (12 oz.)", strMeasure9:"3 cups", strMeasure10:"", strMeasure11:"",strMeasure12:"",strMeasure13:"", strMeasure14:"", strMeasure15:"", strMeasure16:"null", strMeasure17:"null", strMeasure18:"null", strMeasure19:"null", strMeasure20:"null")
    }
    
    static func example3() -> [Ingredients] {
        var ingredients = [Ingredients]()
        
        ingredients.append(Ingredients(id: 1, ingredient: "ingredient1", measure: "measure1"))
        ingredients.append(Ingredients(id: 2,ingredient: "ingredient2", measure: "measure2"))
        
        return ingredients
    }
}
