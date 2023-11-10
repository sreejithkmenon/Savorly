//
//  MealDetailView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI

struct MealDetailView: View {
    
    let meal: MealList
    let imageSize: CGFloat = 300
    
    @StateObject var mealDetailViewModel = MealDetailViewModel()
    
    var body: some View {
        VStack {
            if mealDetailViewModel.isLoading {
                ProgressView()
            }
            
            else if mealDetailViewModel.errorMessage != nil  {
                ErrorMealDetailView(mealDetailViewModel: mealDetailViewModel)
            }
            
            else {
                MealDetailSubView(meal: mealDetailViewModel.mealsDetail[0], ingredients: mealDetailViewModel.ingredients)
            }
        }
        .onAppear() {
            mealDetailViewModel.fetchMealByID(idMeal: meal.id)
        }
    }
}

//struct MealDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealDetailView(meal: MealList.example1())
//    }
//}





















//if mealDetailViewModel.isLoading {
//    ProgressView()
//}
//
//else if mealDetailViewModel.errorMessage != nil  {
//    ErrorMealDetailView(mealDetailViewModel: mealDetailViewModel)
//}
//
//else {
//    MealDetailSubView(meal: mealDetailViewModel.mealsDetail[0], ingredients: mealDetailViewModel.ingredients)
//}