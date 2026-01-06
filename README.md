# Flutter News App

A modern **Flutter News App** that consumes APIs to display the latest news in a clean and interactive UI.  
The app features a **splash screen** and a **scrollable home page** showing all news items with category sections, search functionality, and detailed news views.

## Features

- **Splash Screen:** Simple and branded app launch screen.  
- **Home Screen:** Scrollable page displaying all news articles.  
- **Categories Section:** Horizontal category rows with clickable items.  
- **Search:** Search news using API-based filtering.  
- **News Details:** View full news/product details on item click.  
- **API Integration:** Fetch all products/news and search results using GET requests.  
- **State Management:** Efficient state handling using Flutter Bloc.  

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/flutter-ecommerce-ui.git

2. **Navigate to the project directory:**
    ```bash
    cd flutter-ecommerce-ui
3.  **Install dependencies:**
    ```bash
    flutter pub get
4.  **Run the app:**
    ```bash
    flutter run
    
## Screenshots

*Add screenshots here to showcase the UI.*

## Technologies & Dependencies

```yaml
flutter:
  sdk: flutter
cupertino_icons: ^1.0.8
flutter_svg: ^2.2.3
dio: ^5.9.0
flutter_bloc: ^9.1.1


```
## Project Structure
```text
lib/
├── main.dart         # Application entrypoint
├── features/         # Feature modules (e.g. news feature - data, domain, presentation)
└── model/            # Shared data model classes used by the app
```

