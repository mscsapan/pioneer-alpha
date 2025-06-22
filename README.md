# pioneer_alpha

<strong>📁 Project Architecture (MVC)</strong><br/>
This Flutter project follows a clean and modular MVC-inspired architecture, with a clear separation between data, business logic, and UI layers. This structure ensures better scalability, testability, and maintainability.

├── <strong>data/</strong> &nbsp;&nbsp;# Handles all data-related logic and external communication<br/>
│ ├── <strong>data_provider/</strong> &nbsp;&nbsp;# Manages data flow from remote/local sources<br/>
│ │ ├── <strong>local_data_source/</strong> &nbsp;&nbsp;# Manages local cache or persistent storage (e.g., SharedPreferences, SQLite)<br/>
│ │ ├── <strong>remote_data_source/</strong> &nbsp;&nbsp;# Handles API calls using HTTP client<br/>
│ │ ├── <strong>network_parser/</strong> &nbsp;&nbsp;# Parses API JSON responses into Dart models<br/>
│ │ └── <strong>remote_urls.dart</strong> &nbsp;&nbsp;# Centralized file for API endpoint URLs<br/>
│ ├── <strong>dummy_data/</strong> &nbsp;&nbsp;# Contains mock/test data for development and testing<br/>
│ └── <strong>models/</strong> &nbsp;&nbsp;# Defines the structure of app data (model classes)<br/>

├── <strong>logic/</strong> &nbsp;&nbsp;# Handles all business logic, state management, and app data flow<br/>
│ ├── <strong>bloc/</strong> &nbsp;&nbsp;# Manages state using the BLoC (Business Logic Component) pattern<br/>
│ ├── <strong>cubit/</strong> &nbsp;&nbsp;# Lightweight state management using Cubit for simpler flows<br/>
│ └── <strong>repository/</strong> &nbsp;&nbsp;# Abstract and concrete classes that connect UI with data sources<br/>

├── <strong>presentation/</strong> &nbsp;&nbsp;# Handles UI components, screens, and widgets<br/>
│ ├── <strong>errors/</strong> &nbsp;&nbsp;# UI components for handling and displaying errors<br/>
│ ├── <strong>routes/</strong> &nbsp;&nbsp;# Defines app navigation and route management<br/>
│ ├── <strong>screens/</strong> &nbsp;&nbsp;# All visual screens and views used throughout the app<br/>
│ ├── <strong>utils/</strong> &nbsp;&nbsp;# Common utility functions (formatting, validators, helpers)<br/>
│ └── <strong>widget/</strong> &nbsp;&nbsp;# Reusable widgets (buttons, cards, loaders, etc.)<br/>

├── <strong>dependencies_injection/</strong> &nbsp;&nbsp;# Central place for registering repositories, Cubits, and BLoCs using a service locator or injection container<br/>

├── <strong>pubspec.yaml</strong> &nbsp;&nbsp;# Project dependencies, fonts, assets, and package configuration<br/>
├── <strong>README.md</strong> &nbsp;&nbsp;# Overview, setup guide, and documentation for the project<br/>
└── <strong>main.dart</strong> &nbsp;&nbsp;# App's main entry point and root widget<br/>

