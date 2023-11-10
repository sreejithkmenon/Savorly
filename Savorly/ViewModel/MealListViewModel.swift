//
//  RecipeViewModel.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

class MealListViewModel: ObservableObject {
    
    @Published var mealsList = [MealList]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllMealsList()
    }
    
    func fetchAllMealsList() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: AppConstants.URLs.getMealsListURL)
        service.fetchMealsList(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .success(let mealsList):
                    self.mealsList = DataMapper.shared.sortMealListAlphabetically(mealList: mealsList)
                }
            }
        }
        
    }
    
    static func errorState() -> MealListViewModel {
        let fetcher = MealListViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> MealListViewModel {
        let fetcher = MealListViewModel()
        fetcher.mealsList = [MealList.example1(), MealList.example2()]
        return fetcher
    }
    
}
