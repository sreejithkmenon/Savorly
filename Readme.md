# Savorly iOS App

## Overview

Savorly is an iOS application developed by Sreejith Menon as part of the Fetch iOS Coding Challenge. The app enables users to browse and view detailed information about various dessert recipes, leveraging the MealDB API for data.

## Installation

To run the Savorly app:

1. Clone the repository to your local machine.
2. Open `Savorly.xcodeproj` in Xcode.
3. Ensure you are using the latest version of Xcode.
4. Build and run the application on an iOS Simulator or a physical device.

## Features

- **Meal List**: Fetches and displays meals from the Dessert category via the MealDB API.
- **Meal Details**: Presents detailed information including meal name, instructions, and ingredients.
- **Data Filtering**: Filters out null or empty values from the API for better data quality.
- **User-Friendly Design**: Incorporates basic UI/UX design principles for ease of use.

## Project Structure

- **Assets**: App icons and color assets.
- **Constants**: App-wide constants.
- **Extension**: Swift extensions, like `ColorExtension`.
- **Helper**: Helper classes, such as `DataManager`.
- **Model**: Data models for meal details and lists.
- **Networking**: Network operations and API calls.
- **View**: SwiftUI views for the app's UI.
- **ViewModel**: View models for UI-related data processing.

## Additional Notes

- Adheres to MVVM architecture.
- Unit tests in `SavorlyTests`.
- Developed and tested with the latest Xcode version.

## Author

**Sreejith Menon (he/him/his)**
Staff Software Engineer, iOS

New York, NY 10027
Mobile: +1 (201) 920-6089
Email: sreejithakamenon@gmail.com
LinkedIn: https://www.linkedin.com/in/sreejith-k-menon/
Portfolio: https://sreejithkmenon.github.io

## Contribution

For contributions or suggestions, please create a pull request or raise an issue in the repository.

