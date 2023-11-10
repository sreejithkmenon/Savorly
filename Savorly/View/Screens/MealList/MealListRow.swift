//
//  MealRow.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI
import CachedAsyncImage

struct MealListRow: View {
    
    let meal: MealList
    let imageSize: CGFloat = AppConstants.UIUtils.mealListRowImageSize
    
    var body: some View {
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
                .cornerRadius(AppConstants.UIUtils.cachedAsyncImageMealListRowCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: AppConstants.UIUtils.cachedAsyncImageMealListRowCornerRadius)
                        .stroke(Color.init(hex: AppConstants.UIUtils.imageBorderHexColor), lineWidth: AppConstants.UIUtils.cachedAsyncImageMealListRowCornerLineWidth)
                )
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading) {
                Text(meal.strMeal)
                    .bold()
                    .font(.title3)
                
                Spacer()
            }
            .padding()
        }
        
    }
}


struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        MealListRow(meal: MealList.example1())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
