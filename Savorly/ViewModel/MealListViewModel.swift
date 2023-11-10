//
//  RecipeViewModel.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

/// `MealListViewModel` is a class responsible for handling the view logic for a list of meals.
/// It uses an API service to fetch meal data and updates the UI accordingly.
class MealListViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var mealsList = [MealList]()    // The list of meals to be displayed in the UI.
    @Published var isLoading: Bool = false     // A flag indicating whether the data is currently being loaded.
    @Published var errorMessage: String? = nil // An optional string to hold any error message.
    
    let service: APIServiceProtocol  // The API service used for fetching meals.
    
    // MARK: - Initializer
    
    /// Initializes a `MealListViewModel` with a given service.
    /// - Parameter service: The API service used for fetching meals data. Default is `APIService()`.
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllMealsList()  // Fetches the list of meals upon initialization.
    }
    
    // MARK: - API Call
    
    /// Fetches the complete list of meals from the API.
    /// Updates the `mealsList`, `isLoading`, and `errorMessage` properties based on the API call result.
    func fetchAllMealsList() {
        
        isLoading = true
        errorMessage = nil
        
        // Constructing the URL for the API call.
        let url = URL(string: AppConstants.URLs.getMealsListURL)
        
        // Fetching the meals list using the service.
        service.fetchMealsList(url: url) { [unowned self] result in
            
            // Ensuring the UI is updated on the main thread.
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    // Updating the error message in case of failure.
                    self.errorMessage = error.localizedDescription
                case .success(let mealsList):
                    // Processing and updating the meals list on successful API call.
                    self.mealsList = DataManager.shared.manageMealListData(mealList: mealsList)
                }
            }
        }
    }
    
    // MARK: - Mock States for Testing
    
    /// Creates a `MealListViewModel` instance representing an error state.
    /// Useful for testing error handling in the UI.
    /// - Returns: A `MealListViewModel` instance in an error state.
    static func errorState() -> MealListViewModel {
        let fetcher = MealListViewModel()
        // Setting a mock error message.
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    /// Creates a `MealListViewModel` instance representing a success state.
    /// Useful for testing successful data loading in the UI.
    /// - Returns: A `MealListViewModel` instance in a success state.
    static func successState() -> MealListViewModel {
        let fetcher = MealListViewModel()
        // Setting a mock list of meals.
        fetcher.mealsList = [MealList.example1(), MealList.example2()]
        return fetcher
    }
}
