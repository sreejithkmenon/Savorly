//
//  MealDetailViewModel.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

/// `MealDetailViewModel` is a class responsible for managing the meal detail data. It conforms to `ObservableObject` to allow SwiftUI views to subscribe to changes.
class MealDetailViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    /// Published property to hold detailed information about meals. SwiftUI views will update when this data changes.
    @Published var mealsDetail = [MealDetail]()
    
    /// Published property to store an array of ingredients. Updated in conjunction with mealsDetail.
    @Published var ingredients: [Ingredients] = []
    
    /// Indicates whether the data is currently loading. Useful for showing loading indicators in the UI.
    @Published var isLoading: Bool = false
    
    /// Holds any error messages that may occur during data fetching. Can be used to display error alerts in the UI.
    @Published var errorMessage: String? = nil
    
    /// The ID of the meal for which details are being fetched.
    @Published var idMeal: String? = ""
    
    // MARK: - Dependencies
    
    /// The service responsible for fetching meal data. Conforms to `APIServiceProtocol` for modularity and testability.
    let service: APIServiceProtocol
    
    // MARK: - Initializer
    
    /// Initializes the ViewModel, optionally taking a service conforming to `APIServiceProtocol`. Defaults to `APIService()` if no service is provided.
    /// Sets the initial loading state and clears any existing error messages.
    init(service: APIServiceProtocol = APIService()) {
        isLoading = true
        errorMessage = nil
        
        self.service = service
    }
    
    // MARK: - Data Fetching
    
    /// Fetches meal details by the provided meal ID.
    /// - Parameter idMeal: The ID of the meal to fetch.
    /// Updates `isLoading` to reflect the fetching state and resets any previous error messages.
    func fetchMealByID(idMeal: String) {
        
        self.idMeal = idMeal
        
        isLoading = true
        errorMessage = nil
        
        // Constructs the URL for the API request using the provided meal ID.
        let url = URL(string: AppConstants.URLs.getMealByIDURL + idMeal)
        
        // Calls the service to fetch meal details, handling the result asynchronously.
        service.fetchMealByID(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    // On failure, sets the error message.
                    self.errorMessage = error.localizedDescription
                case .success(let mealsDetail):
                    // On success, updates the meal details and ingredients.
                    self.mealsDetail = mealsDetail
                    self.ingredients = DataManager.shared.getIngredientsMeasureArr(meal: mealsDetail[0])
                }
            }
        }
    }
    
    // MARK: - Mock States for Testing
    
    /// Returns a mock `MealDetailViewModel` in an error state for testing purposes.
    static func errorState() -> MealDetailViewModel {
        let fetcher = MealDetailViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    /// Returns a mock `MealDetailViewModel` in a success state with example data for testing purposes.
    static func successState() -> MealDetailViewModel {
        let fetcher = MealDetailViewModel()
        fetcher.mealsDetail = [MealDetail.example1(), MealDetail.example2()]
        return fetcher
    }
}
