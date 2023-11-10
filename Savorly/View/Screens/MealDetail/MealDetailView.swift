//
//  MealDetailView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI

/// `MealDetailView` is a SwiftUI View that displays the details of a meal.
/// It makes use of a view model (`MealDetailViewModel`) to fetch and manage meal data.
struct MealDetailView: View {
    
    // MARK: - Properties
    
    /// The `MealList` object containing the basic information of the meal.
    /// This is provided as an input to the view to fetch further details.
    let meal: MealList
    
    /// The size for the image in the meal detail view, defined in `AppConstants`.
    let imageSize: CGFloat = AppConstants.UIUtils.mealDetailImageSize
    
    /// The ViewModel responsible for fetching and managing meal details.
    /// It is observed here to react to changes in the meal detail data.
    @StateObject var mealDetailViewModel = MealDetailViewModel()
    
    // MARK: - Body
    
    /// The body of the `MealDetailView`.
    /// It presents different views based on the loading state and data availability.
    var body: some View {
        VStack {
            // Show a loading indicator while the meal details are being fetched.
            if mealDetailViewModel.isLoading {
                ProgressView()
            }
            
            // Show an error view if there is an error message.
            // Assumption: `errorMessage` being non-nil is used as an indicator of an error state.
            else if mealDetailViewModel.errorMessage != nil  {
                ErrorMealDetailView(mealDetailViewModel: mealDetailViewModel)
            }
            
            // Show the meal details if data is available and there are no errors.
            // Assumption: The first element of `mealsDetail` is used as the primary detail object.
            else {
                MealDetailExtendedView(meal: mealDetailViewModel.mealsDetail[0], ingredients: mealDetailViewModel.ingredients)
            }
        }
        // Fetch meal details when the view appears.
        .onAppear() {
            mealDetailViewModel.fetchMealByID(idMeal: meal.id)
        }
    }
}

/// A preview provider for `MealDetailView`.
/// This is used by Xcode's canvas to render previews of the view.
struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Providing an example meal for preview purposes.
        MealDetailView(meal: MealList.example1())
    }
}
