//
//  APIMockService.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

/// `APIMockService` is a mock implementation of `APIServiceProtocol`.
/// It's used for testing purposes, simulating network interactions by providing predefined responses.
/// This mock service allows for isolated testing of components that depend on API calls without
/// the need for actual network requests.
struct APIMockService: APIServiceProtocol {
    
    /// `resultMealList` is a `Result` type storing either a list of `MealList` objects or an `APIError`.
    /// It represents a predefined response for the `fetchMealsList` method.
    /// This property allows for the simulation of different scenarios (success/failure) during testing.
    var resultMealList: Result<[MealList], APIError>
    
    /// `resultMealByID` is a `Result` type storing either a list of `MealDetail` objects or an `APIError`.
    /// It represents a predefined response for the `fetchMealByID` method.
    /// Similar to `resultMealList`, this property enables the testing of various outcomes for fetching meal details.
    var resultMealByID: Result<[MealDetail], APIError>
    
    /// Fetches a list of meals. In this mock implementation, it returns the predefined `resultMealList`.
    ///
    /// - Parameters:
    ///   - url: The URL for the API call. In this mock implementation, the URL is not used.
    ///          Typically, this parameter would be utilized in a real API call to specify the endpoint.
    ///   - completion: A completion handler that takes a `Result` type as its parameter,
    ///                 containing either an array of `MealList` or an `APIError`.
    ///                 This handler is executed with `resultMealList` as its argument.
    func fetchMealsList(url: URL?, completion: @escaping (Result<[MealList], APIError>) -> Void) {
        completion(resultMealList)
    }
    
    /// Fetches meal details by ID. This mock implementation returns the predefined `resultMealByID`.
    ///
    /// - Parameters:
    ///   - url: The URL for the API call. Similar to `fetchMealsList`, the URL is not utilized in the mock.
    ///          In a real implementation, this would be used to construct the request for specific meal details.
    ///   - completion: A completion handler that is executed with `resultMealByID` as its argument,
    ///                 returning either an array of `MealDetail` or an `APIError`.
    func fetchMealByID(url: URL?, completion: @escaping (Result<[MealDetail], APIError>) -> Void) {
        completion(resultMealByID)
    }
    
}

