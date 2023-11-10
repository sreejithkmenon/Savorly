//
//  MealDetailExtendedView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI
import CachedAsyncImage

struct MealDetailExtendedView: View {
    
    let meal: MealDetail
    let ingredients: [Ingredients]
    
    let imageSize: CGFloat = AppConstants.UIUtils.mealDetailExtendedImageSize
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                HStack {
                    if meal.strMealThumb != nil {
                        CachedAsyncImage(url: URL(string: meal.strMealThumb!)) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: imageSize, height: imageSize)
                                    .clipped()
                                
                            } else if phase.error != nil {
                                
                                Image(systemName: AppConstants.UIUtils.noImageSymbol)
                                    .font(.largeTitle)
                                    .frame(width: imageSize, height: imageSize)
                                
                            } else {
                                ProgressView()
                                    .frame(width: imageSize, height: imageSize)
                            }
                        }
                        .cornerRadius(AppConstants.UIUtils.cachedAsyncImageMealDetailCornerRadius)
                        .overlay(
                            RoundedRectangle(cornerRadius: AppConstants.UIUtils.cachedAsyncImageMealDetailCornerRadius)
                                .stroke(Color.init(hex: AppConstants.UIUtils.imageBorderHexColor), lineWidth: AppConstants.UIUtils.cachedAsyncImageMealDetailCornerLineWidth)
                        )
                    } else {
                        Color.gray.frame(width: imageSize, height: imageSize)
                    }
                    
                    VStack {
                        
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
                
                Divider()
                    .padding(.top)
                    .padding(.bottom)
                
                if let instructions = meal.strInstructions {
                    
                    HStack {
                        Text(AppConstants.UIUtils.instructionsMealTitle)
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                    }
                    
                    Text(instructions)
                        .padding(.top, AppConstants.UIUtils.instructionsMealDetailTextPaddingTop)
                }
                
                Divider()
                    .padding(.top)
                    .padding(.bottom)
                
                if ingredients.count > 0 {
                    
                    VStack(alignment: .leading) {
                        
                        Text(AppConstants.UIUtils.ingredientsMealTitle)
                            .font(.title2)
                            .bold()
                            .padding(.bottom, AppConstants.UIUtils.ingredientsMealDetailTitlePaddingBottom)
                        
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

struct MealDetailExtendedView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailExtendedView(meal: MealDetail.example1(), ingredients: MealDetail.example3())
    }
}
