//
//  MealDetailViewModel.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    
    @Published var mealsDetail = [MealDetail]()
    @Published var ingredients : [Ingredients] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var idMeal: String? = ""
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        isLoading = true
        errorMessage = nil
        
        self.service = service
    }
    
    func fetchMealByID(idMeal: String) {
        
        self.idMeal = idMeal
        
        isLoading = true
        errorMessage = nil
                
        let url = URL(string: AppConstants.URLs.getMealByIDURL + idMeal)
        service.fetchMealByID(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .success(let mealsDetail):
                    self.mealsDetail = mealsDetail
                    self.ingredients = DataMapper.shared.getIngredientsMeasureArr(meal: mealsDetail[0])
                }
            }
        }
    }
}


