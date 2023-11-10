//
//  MealListView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI

struct MealListView: View {
    
    @StateObject var mealListViewModel = MealListViewModel()
    
    var body: some View {
        
        if mealListViewModel.isLoading {
            ProgressView()
        }
        
        else if mealListViewModel.errorMessage != nil  {
            ErrorMealListView(mealListViewModel: mealListViewModel)
        }
        
        else {
            NavigationView {
                List {
                    ForEach(mealListViewModel.mealsList) { meal in
                        NavigationLink {
                            MealDetailView(meal: meal)
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            MealListRow(meal: meal)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle(AppConstants.App.appName)
            }
        }
    }
}


struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
