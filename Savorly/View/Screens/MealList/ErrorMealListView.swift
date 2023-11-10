//
//  ErrorMealListView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 09/11/23.
//

import SwiftUI

struct ErrorMealListView: View {
        
    @ObservedObject var mealListViewModel: MealListViewModel

    var body: some View {
        VStack {
            
            Text(AppConstants.App.appName)
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text(mealListViewModel.errorMessage ?? "")
                .padding()
            
            Button {
                mealListViewModel.fetchAllMealsList()
            } label: {
                Text(AppConstants.ErrorMessage.tryAgainMessage)
            }
            .padding()
            
        }
    }
}

struct ErrorMealListView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMealListView(mealListViewModel: MealListViewModel())
    }
}
