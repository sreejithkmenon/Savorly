//
//  MealDetailSubView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI
import CachedAsyncImage

struct MealDetailSubView: View {
    
    let meal: MealDetail
    let ingredients: [Ingredients]
    
    let imageSize: CGFloat = 125
    
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
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.init(hex: AppConstants.UIUtils.imageBorderHexColor), lineWidth: 1)
                        )
                    } else {
                        Color.gray.frame(width: imageSize, height: imageSize)
                    }
                    
                    VStack {
                        Text(meal.strMeal!)
                            .bold()
                            .font(.title2)
                            .padding()
                        
                        Spacer()
                    }
                    
                    
                    
                    Spacer()
                }
                
                Divider()
                    .padding(.top)
                    .padding(.bottom)
                
                if meal.strInstructions != nil {
                    
                    HStack {
                        Text(AppConstants.UIUtils.instructionsMealTitle)
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                    }
                    
                    Text(meal.strInstructions!)
                        .padding(.top, 1)
                }
                
                Divider()
                    .padding(.top)
                    .padding(.bottom)
                
                if ingredients.count > 0 {
                    
                    VStack(alignment: .leading) {
                        
                        Text(AppConstants.UIUtils.ingredientsMealTitle)
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 1)
                        
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

struct MealDetailSubView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailSubView(meal: MealDetail.example1(), ingredients: MealDetail.example3())
    }
}
