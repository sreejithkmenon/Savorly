//
//  MealRow.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI
import CachedAsyncImage

/// `MealListRow` is a SwiftUI view for displaying a single row in a meal list.
/// It includes an image of the meal and the meal's name.
struct MealListRow: View {
    
    // MARK: - Properties
    
    /// The `MealList` model representing the meal.
    let meal: MealList
    
    /// The size for the meal image, defined in the app's constants.
    let imageSize: CGFloat = AppConstants.UIUtils.mealListRowImageSize
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            // Checking if the meal image URL exists.
            if meal.strMealThumb != nil {
                // Using `CachedAsyncImage` to load and cache the meal image.
                CachedAsyncImage(url: URL(string: meal.strMealThumb!)) { phase in
                    // Handling different states of image loading.
                    if let image = phase.image {
                        // Displaying the image if successfully loaded.
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                    } else if phase.error != nil {
                        // Displaying a placeholder image in case of an error.
                        Image(systemName: AppConstants.UIUtils.noImageSymbol)
                            .font(.largeTitle)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        // Showing a progress view while the image is loading.
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
                .cornerRadius(AppConstants.UIUtils.cachedAsyncImageMealListRowCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: AppConstants.UIUtils.cachedAsyncImageMealListRowCornerRadius)
                        .stroke(Color.init(hex: AppConstants.UIUtils.imageBorderHexColor), lineWidth: AppConstants.UIUtils.cachedAsyncImageMealListRowCornerLineWidth)
                )
            } else {
                // Displaying a gray placeholder when there is no image URL.
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            // Vertical stack for meal's name.
            VStack(alignment: .leading) {
                // Displaying the meal's name.
                Text(meal.strMeal)
                    .bold()
                    .font(.title3)
                
                Spacer()
            }
            .padding()
        }
    }
}

/// `MealRow_Previews` is a preview provider for SwiftUI previews.
/// It facilitates previewing the `MealListRow` view in Xcode.
struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        MealListRow(meal: MealList.example1())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
