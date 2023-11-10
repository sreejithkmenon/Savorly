//
//  ErrorMealDetailView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 09/11/23.
//

import SwiftUI

struct ErrorMealDetailView: View {
    @ObservedObject var mealDetailViewModel: MealDetailViewModel

    var body: some View {
        VStack {
            
            Text(AppConstants.App.appName)
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text(mealDetailViewModel.errorMessage ?? "")
                .padding()
            
            Button {
                mealDetailViewModel.fetchMealByID(idMeal: mealDetailViewModel.idMeal!)
            } label: {
                Text(AppConstants.ErrorMessage.tryAgainMessage)
            }
            .padding()
            
        }
    }
}

struct ErrorMealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMealDetailView(mealDetailViewModel: MealDetailViewModel())
    }
}
