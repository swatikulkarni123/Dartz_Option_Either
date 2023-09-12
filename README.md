# Dartz Option and Either

![GitHub stars](https://img.shields.io/github/stars/swatikulkarni123/Dartz_Option_Either?style=social)

Dartz is a powerful functional programming library for Dart and Flutter. In this repository, we explore two fundamental concepts from Dartz: Option and Either. These concepts are particularly useful when making API calls or handling various outcomes in your Dart or Flutter projects.

## Option

An `Option` is a type that represents a value that may or may not be present. It can have two possible values:

1. `none`: This indicates that data is in the process of being fetched, or an API call is in progress.
2. `T`: The `T` type can represent integers, strings, or any data type. In our case, `T` is an `Either<ApiFailure, List<dynamic>>`.

To access the value inside an `Option` variable, you need to use the `fold` method. The `fold` method enforces handling both conditions. You can assign a value to an `Option` using `some(T)`.

## Either

An `Either` is another powerful concept in Dartz. It can have two values:

1. `L`: This represents a failure or error, typically `ApiFailure` in our case.
2. `R`: This represents a success value, often `List<dynamic>` in our context.

Just like with `Option`, you use the `fold` method to access the values inside an `Either` variable.

## BaseController and BaseView

In addition to Option and Either, we've included `BaseController` and `BaseView` in this repository. These components are designed to handle common functionality in your Dart and Flutter projects.

- **BaseController**: This is a base controller class that provides common functionality for your controllers. It can help manage state, perform common operations, and simplify your app's logic.

- **BaseView**: The `BaseView` is a base view class that offers a foundation for your UI components. It can help with layout, theming, and providing a consistent look and feel for your app.

## Usage Example

Here's a brief example of how to use `Option` and `Either`:

```dart
Option<Either<ApiFailure, List<dynamic>>> apiResponse = none();

// Assign a value
apiResponse = some(left(ApiFailure)); // Represents an API failure
// OR
apiResponse = some(right(List<dynamic>)); // Represents API success

apiResponse.fold(
  () {
    // Handle the case when an API call is in progress
  },
  (eitherValue) => eitherValue.fold(
    (apiFailure) {
      // Handle API error
    },
    (success) {
      // Handle API success
    },
  ),
);
