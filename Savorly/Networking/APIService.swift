//
//  APIService.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation
import SwiftUI

/// `APIService` conforms to `APIServiceProtocol` providing network service methods.
struct APIService: APIServiceProtocol {
    
    /// Fetches a generic type that conforms to `Decodable` from a specified URL.
    /// - Parameters:
    ///   - type: The `Decodable` type to be fetched.
    ///   - url: The URL to fetch the data from.
    ///   - completion: A closure to handle the result, either success with the fetched object or failure with an `APIError`.
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        // Check for a valid URL, else return with a badURL error.
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        // Create a data task to fetch data from the URL.
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Handle potential errors during the fetch.
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                // Decode the data into the specified type.
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        // Start the data task.
        task.resume()
    }
    
    /// Fetches a list of meals from a specified URL.
    /// - Parameters:
    ///   - url: The URL to fetch the meals list from.
    ///   - completion: A closure to handle the result, either success with the fetched meals list or failure with an `APIError`.
    func fetchMealsList(url: URL?, completion: @escaping(Result<[MealList], APIError>) -> Void) {
        // Similar implementation and error handling as the fetch method.
        // Additional assumption: The data is expected to be in `RecipeList` format.
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        // Fetch and decode the data into a list of meals.
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Error handling and response parsing similar to the fetch method.
            // Decodes the data into `RecipeList` and returns its `mealListArr`.
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let mealListObj = try decoder.decode(RecipeList.self, from: data)
                    completion(Result.success(mealListObj.mealListArr))
                    
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
    
    /// Fetches detailed information about a meal by its ID.
    /// - Parameters:
    ///   - url: The URL to fetch the meal detail from.
    ///   - completion: A closure to handle the result, either success with the fetched meal detail or failure with an `APIError`.
    func fetchMealByID(url: URL?, completion: @escaping(Result<[MealDetail], APIError>) -> Void) {
        // Similar implementation and error handling as the fetchMealsList method.
        // Assumption: The data fetched is expected to be in `RecipeDetail` format.
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        // Fetch and decode the data into detailed information about the meal.
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Error handling and response parsing similar to the fetch method.
            // Decodes the data into `RecipeDetail` and returns its `mealDetailArr`.
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let mealDetailObj = try decoder.decode(RecipeDetail.self, from: data)
                    completion(Result.success(mealDetailObj.mealDetailArr))
                    
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
}
