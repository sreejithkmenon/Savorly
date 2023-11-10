//
//  MealDetailExtendedView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI
import CachedAsyncImage

/// `MealDetailExtendedView` provides a detailed view of a meal, including its image, title, and ingredients.
/// It utilizes `CachedAsyncImage` for efficient loading and caching of meal images.
struct MealDetailExtendedView: View {
    
    /// `meal` holds the details of the meal including its image URL and other metadata.
    let meal: MealDetail
    
    /// `ingredients` is an array of ingredients used in the meal.
    let ingredients: [Ingredients]
    
    /// `imageSize` is a constant defining the size of the meal image.
    let imageSize: CGFloat = AppConstants.UIUtils.mealDetailExtendedImageSize
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Image and title container.
                HStack {
                    // Load and display the meal image if available.
                    if meal.strMealThumb != nil {
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
                        // Apply corner radius and border to the image.
                        .cornerRadius(AppConstants.UIUtils.cachedAsyncImageMealDetailCornerRadius)
                        .overlay(
                            RoundedRectangle(cornerRadius: AppConstants.UIUtils.cachedAsyncImageMealDetailCornerRadius)
                                .stroke(Color.init(hex: AppConstants.UIUtils.imageBorderHexColor), lineWidth: AppConstants.UIUtils.cachedAsyncImageMealDetailCornerLineWidth)
                        )
                    } else {
                        // Display a gray placeholder if no image URL is provided.
                        Color.gray.frame(width: imageSize, height: imageSize)
                    }
                    
                    // Title container.
                    VStack {
                        // Display the meal title if available.
                        if let title = meal.strMeal {
                            Text(title)
                                .bold()
                                .font(.title2)
                                .padding()
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                
                // Divider for visual separation.
                Divider()
                    .padding(.top)
                    .padding(.bottom)
                
                // Instructions container.
                if let instructions = meal.strInstructions {
                    HStack {
                        Text(AppConstants.UIUtils.instructionsMealTitle)
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                    }
                    
                    // Displaying the meal preparation instructions.
                    Text(instructions)
                        .padding(.top, AppConstants.UIUtils.instructionsMealDetailTextPaddingTop)
                }
                
                // Another divider for visual separation.
                Divider()
                    .padding(.top)
                    .padding(.bottom)
                
                // Ingredients list container.
                if ingredients.count > 0 {
                    VStack(alignment: .leading) {
                        Text(AppConstants.UIUtils.ingredientsMealTitle)
                            .font(.title2)
                            .bold()
                            .padding(.bottom, AppConstants.UIUtils.ingredientsMealDetailTitlePaddingBottom)
                        
                        // Loop through each ingredient and display it with its measure.
                        ForEach(ingredients) { (item: Ingredients) in
                            HStack {
                                Text(item.ingredient)
                                
                                Text(AppConstants.UIUtils.ingredientsMealSeparatorSymbol)
                                
                                Text(item.measure)
                            }
                        }
                    }
                }
            }
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

/// `MealDetailExtendedView_Previews` provides a preview for SwiftUI Previews.
struct MealDetailExtendedView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailExtendedView(meal: MealDetail.example1(), ingredients: MealDetail.example3())
    }
}
