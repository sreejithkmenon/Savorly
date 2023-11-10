//
//  MealListView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI

/// `MealListView` is a SwiftUI view that displays a list of meals.
/// It uses `MealListViewModel` to manage and present the meal data.
struct MealListView: View {
    
    // MARK: - Properties
    
    /// StateObject of `MealListViewModel` to observe and react to changes in the meal list.
    @StateObject var mealListViewModel = MealListViewModel()
    
    // MARK: - Body
    
    /// The body of the `MealListView`.
    /// It conditionally renders different views based on the loading state and presence of errors.
    var body: some View {
        
        // Shows a progress view when data is loading.
        if mealListViewModel.isLoading {
            ProgressView()
        }
        
        // Shows an error view if there is an error message.
        else if mealListViewModel.errorMessage != nil  {
            ErrorMealListView(mealListViewModel: mealListViewModel)
        }
        
        // Shows the list of meals if there are no errors and not loading.
        else {
            NavigationView {
                List {
                    // Iterates over the list of meals and creates a row for each meal.
                    ForEach(mealListViewModel.mealsList) { meal in
                        NavigationLink {
                            // Navigates to the detail view of the selected meal.
                            MealDetailView(meal: meal)
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            // The visual representation of each row in the meal list.
                            MealListRow(meal: meal)
                        }
                    }
                }
                .listStyle(PlainListStyle()) // Sets the list style to plain.
                .navigationTitle(AppConstants.App.appName) // Sets the navigation title.
            }
        }
    }
}

/// `MealListView_Previews` provides a preview for `MealListView`.
/// This is only used in Xcode's canvas and SwiftUI previews.
struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
