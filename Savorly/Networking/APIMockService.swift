//
//  APIMockService.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var resultMealList: Result<[MealList], APIError>
    var resultMealByID: Result<[MealDetail], APIError>
    
    func fetchMealsList(url: URL?, completion: @escaping (Result<[MealList], APIError>) -> Void) {
        completion(resultMealList)
    }
    
    func fetchMealByID(url: URL?, completion: @escaping (Result<[MealDetail], APIError>) -> Void) {
        completion(resultMealByID)
    }
    
}
