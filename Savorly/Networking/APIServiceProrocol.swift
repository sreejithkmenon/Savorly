//
//  APIServiceProrocol.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

/// Protocol defining the required services for an API service.
/// This protocol is used to fetch meal-related data from a remote source.
protocol APIServiceProtocol {
    
    /// Fetches a list of meals from a given URL.
    ///
    /// The method asynchronously fetches data and returns a result which is either
    /// an array of `MealList` objects or an `APIError` in case of failure.
    ///
    /// - Parameters:
    ///   - url: An optional `URL` from which to fetch the meals list. If `nil`, the method should handle it appropriately.
    ///   - completion: A completion handler that is called when the fetch operation is finished.
    ///     This handler is passed a `Result` type that contains either the fetched data as `[MealList]`
    ///     or an `APIError` in case of failure.
    func fetchMealsList(url: URL?, completion: @escaping(Result<[MealList], APIError>) -> Void)
    
    /// Fetches detailed information about a meal by its ID.
    ///
    /// This method is similar to `fetchMealsList` but is used for fetching detailed data
    /// about a specific meal. The method asynchronously fetches data and returns a result
    /// which is either an array of `MealDetail` objects or an `APIError` in case of failure.
    ///
    /// - Note: The method expects a meal ID to be included in the `URL`. Handling of a `nil` URL
    ///         should be implemented appropriately.
    ///
    /// - Parameters:
    ///   - url: An optional `URL` from which to fetch the meal details. The URL should contain the meal ID.
    ///   - completion: A completion handler that is called when the fetch operation is completed.
    ///     This handler is passed a `Result` type that contains either the fetched data as `[MealDetail]`
    ///     or an `APIError` in case of failure.
    func fetchMealByID(url: URL?, completion: @escaping(Result<[MealDetail], APIError>) -> Void)
}
