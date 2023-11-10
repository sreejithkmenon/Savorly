//
//  ContentView.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI

// MARK: - ContentView
/// `ContentView` is the root view of the application.
/// It uses a vertical stack (VStack) to layout its subviews.
/// In this case, it contains only `MealListView`.
struct ContentView: View {
    
    // The body property is the only required property of the View protocol.
    // It returns some View, which represents the content of this view.
    var body: some View {
        VStack {
            // `MealListView` is assumed to be a custom SwiftUI view
            // that lists meals. This view is not defined in this code snippet,
            // so it must be defined elsewhere in the application.
            MealListView()
        }
        // VStack is a simple vertical stack layout,
        // which organizes views linearly along the vertical axis.
    }
}

// MARK: - ContentView_Previews
/// `ContentView_Previews` is a struct conforming to `PreviewProvider`.
/// SwiftUI uses this to render previews in Xcode's canvas.
/// This is particularly useful for seeing UI changes in real-time
/// without needing to run the app on a simulator or device.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // This preview returns an instance of `ContentView`.
        // The preview reflects how `ContentView` will look
        // when used in the application.
        ContentView()
    }
}
