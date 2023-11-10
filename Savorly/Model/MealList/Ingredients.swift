//
//  Ingredients.swift
//  Savorly
//
//  Created by Sreejith K Menon on 09/11/23.
//

import Foundation

struct Ingredients: Identifiable {
    var id: Int
    var ingredient: String = ""
    var measure: String = ""
    
    init(id:Int, ingredient: String, measure: String) {
        self.id = id
        self.ingredient = ingredient
        self.measure = measure
    }
}
