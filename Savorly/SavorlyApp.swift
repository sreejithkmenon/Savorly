//
//  SavorlyApp.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI

/// `SavorlyApp` is the main structure for a SwiftUI application.
///
/// This structure conforms to the `App` protocol, which is a requirement for all SwiftUI applications.
/// The `App` protocol serves as the entry point for the application and is responsible for initializing
/// the application's state and providing the content view.
///
/// SwiftUI applications are structured around a declarative UI paradigm, where the UI components
/// and layout are defined in a way that allows the framework to manage the rendering and state updates.
///
/// - Note: This structure is automatically generated when creating a new SwiftUI project.
///         It's a starting point of the application and is responsible for setting up the initial
///         user interface.
@main
struct SavorlyApp: App {
    /// The `body` property is a required implementation of the `App` protocol.
    /// It defines the content and behavior of the app.
    ///
    /// In SwiftUI, `Scene` is a fundamental building block that represents a part of the user interface.
    /// In most cases, especially in single-window applications like this, a `WindowGroup` is used
    /// as the main scene. `WindowGroup` automatically creates a new window for the app's content.
    ///
    /// `ContentView` is the root view of the application where the actual user interface is defined.
    /// It's a custom view that you would define elsewhere in your project.
    ///
    /// - Returns: A `Scene` which represents the body of the app.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

