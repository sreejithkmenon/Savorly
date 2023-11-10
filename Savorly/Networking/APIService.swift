//
//  APIService.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation
import SwiftUI

struct APIService: APIServiceProtocol {
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }

            }
        }

        task.resume()
    }
    
    
    func fetchMealsList(url: URL?, completion: @escaping(Result<[MealList], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let mealListObj = try decoder.decode(RecipeList.self, from: data)
                    completion(Result.success(mealListObj.mealListArr))
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
                
                
            }
        }
        task.resume()
    }
    
    func fetchMealByID(url: URL?, completion: @escaping(Result<[MealDetail], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
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
