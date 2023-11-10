//
//  ErrorMealDetailView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 09/11/23.
//

import SwiftUI

/// `ErrorMealDetailView` is a SwiftUI view that is responsible for displaying error messages
/// related to meal details. It makes use of the `MealDetailViewModel` to manage the state and
/// data for meal details.
struct ErrorMealDetailView: View {
    // MARK: - Properties
    
    /// An observed object of `MealDetailViewModel` which provides the necessary data and
    /// functions to this view.
    @ObservedObject var mealDetailViewModel: MealDetailViewModel
    
    // MARK: - Body
    
    /// The body of the `ErrorMealDetailView`. It consists of a vertical stack (`VStack`) that contains
    /// the application's name, the error message, and a button to retry fetching the meal details.
    var body: some View {
        VStack {
            
            // Display the application's name in large, bold font.
            Text(AppConstants.App.appName)
                .font(.largeTitle)
                .bold()
                .padding()
            
            // Display the error message from `mealDetailViewModel`.
            // It uses optional chaining since `errorMessage` is an optional property.
            Text(mealDetailViewModel.errorMessage ?? "")
                .padding()
            
            // A button that triggers a retry for fetching meal details by calling
            // `fetchMealByID` from the `mealDetailViewModel`.
            // This assumes that `mealDetailViewModel` has a valid `idMeal` value and
            // `fetchMealByID` function handles fetching logic.
            Button {
                mealDetailViewModel.fetchMealByID(idMeal: mealDetailViewModel.idMeal!)
            } label: {
                Text(AppConstants.ErrorMessage.tryAgainMessage)
            }
            .padding()
            
        }
    }
}

// MARK: - Preview

/// A preview provider for `ErrorMealDetailView`.
/// This allows for visual inspection of this view in Xcode's canvas.
struct ErrorMealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Provides a preview with a default instance of `MealDetailViewModel`.
        ErrorMealDetailView(mealDetailViewModel: MealDetailViewModel())
    }
}

