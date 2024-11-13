# RickMortify

## Description
**RickMortify** is an iOS app that allows Rick and Morty fans to explore detailed information about characters from the series. The app uses the [Rick and Morty API](https://rickandmortyapi.com/) to list characters and retrieve information about each one.

The app is built with an **MVVM** architecture, written in **Swift**, and utilizes **SwiftUI** for the user interface. Key design principles like **SOLID** and clear separation of responsibilities have been applied across different layers.

## Features

- **Tab Bar with Multiple Endpoints**:
  - **Characters**: Displays a paginated list of characters, loading 20 characters per page. Tapping on a character navigates to a detail view showing full information.
  - **Episodes** and **Locations**: These tabs display placeholders, while the primary focus has been on implementing the **Characters** functionality.

- **Characters View**:
  - Automatic pagination when reaching the end of the list, enhancing performance.
  - Navigation to each character’s detail view by tapping a list cell.

## Technical Aspects

- **Development Environment**:
  - Developed using Xcode 16.
  
- **Frameworks and Tools**:
  - **SwiftUI** for all UI views.
  - **Async/Await** to manage asynchronous operations in a cleaner, more structured way.
  
- **Architecture**:
  - Structured with **MVVM** for better organization and maintainability.
  - Layered separation with `data` for network calls, `domain` for mapping and preparing data, and `view` for presentation and UI logic.

- **Data Handling**:
  - API responses are mapped to domain models to ensure data isolation and preparation before displaying it to the user.
  
- **Code Quality**:
  - **SOLID** principles have been followed throughout the implementation.
  - The project currently has **81% test coverage**, with tests implemented across the **data** and **domain** layers, all **mappers** and for **CharactersListViewModel**.

## Installation
1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the app on your preferred simulator or device.