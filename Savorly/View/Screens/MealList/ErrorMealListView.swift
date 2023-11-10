//
//  ErrorMealListView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 09/11/23.
//

import SwiftUI

/// A view for displaying error messages related to the meal list.
///
/// This view is intended to be used when there is an error fetching the meal list. It displays an error message
/// and provides a button to retry fetching the data.
///
/// - Important: This view assumes that the `MealListViewModel` provided to it is already initialized and
///   capable of handling the fetching of meal list and error states.
struct ErrorMealListView: View {
    
    /// The view model responsible for managing the state and logic of the meal list.
    /// This view model is observed for changes, particularly for error messages.
    @ObservedObject var mealListViewModel: MealListViewModel
    
    var body: some View {
        VStack {
            // Displays the application name using a large, bold font.
            Text(AppConstants.App.appName)
                .font(.largeTitle)
                .bold()
                .padding()

            // Displays the current error message from the view model, if any.
            // The error message is assumed to be user-friendly.
            Text(mealListViewModel.errorMessage ?? "")
                .padding()
            
            // A button that triggers a retry of fetching the meal list.
            // The action is delegated to the `mealListViewModel`.
            Button {
                mealListViewModel.fetchAllMealsList()
            } label: {
                Text(AppConstants.ErrorMessage.tryAgainMessage)
            }
            .padding()
        }
    }
}

/// A preview provider for `ErrorMealListView`.
///
/// This preview provider is responsible for generating previews of the `ErrorMealListView` in Xcode's
/// canvas and SwiftUI previews. It initializes a `MealListViewModel` for the preview.
struct ErrorMealListView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMealListView(mealListViewModel: MealListViewModel())
    }
}
