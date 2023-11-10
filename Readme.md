# Savorly: A Recipe Browsing App

## Overview

Savorly is an iOS application developed for the Fetch iOS Coding Challenge. The app allows users to browse dessert recipes using the [TheMealDB API](https://themealdb.com/api.php). It features two main functionalities: listing meals in the Dessert category and displaying detailed information about each meal.

## Features

- **Meal List View:** Displays a list of dessert meals, fetched from [TheMealDB API](https://themealdb.com/api/json/v1/1/filter.php?c=Dessert), sorted alphabetically.
- **Meal Detail View:** Presents detailed information about a selected meal, including the name, instructions, and ingredients/measurements. Details are fetched from [TheMealDB API](https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID).

## Installation

1. Clone the repository to your local machine.
2. Open `Savorly.xcodeproj` in Xcode.
3. Run the project using the latest version of Xcode.

## Project Structure

```
Savorly
├── Assets.xcassets
│   ├── AppIcon.appiconset
│   └── ...
├── Constants
│   └── AppConstants.swift
├── Extension
│   └── ColorExtension.swift
├── Helper
│   └── DataManager.swift
├── Model
│   ├── MealDetail
│   └── MealList
├── Networking
│   ├── APIError.swift
│   └── ...
├── View
│   └── Screens
│       ├── MealDetail
│       └── MealList
└── ViewModel
    ├── MealDetailViewModel.swift
    └── MealListViewModel.swift
```

## Technology Stack

- **SwiftUI:** Used for building the UI of the app.
- **Swift:** Primary programming language.

## Design Considerations

- The app focuses on functionality and meeting the requirements of the coding challenge.
- Basic UI/UX principles are followed to ensure the app is user-friendly.

## Author

- Sreejith K Menon

## Acknowledgements

Special thanks to Fetch for providing this exciting coding challenge and the opportunity to demonstrate my skills in iOS app development.
