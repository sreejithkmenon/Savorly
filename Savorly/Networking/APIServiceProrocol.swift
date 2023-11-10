//
//  APIServiceProrocol.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

protocol APIServiceProtocol {
    func fetchMealsList(url: URL?, completion: @escaping(Result<[MealList], APIError>) -> Void)
    
    func fetchMealByID(url: URL?, completion: @escaping(Result<[MealDetail], APIError>) -> Void)
}
