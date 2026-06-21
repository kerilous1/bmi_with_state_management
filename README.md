# BMI Calculator :

A fast, responsive, and cleanly designed Body Mass Index (BMI) calculator built with Flutter. The app provides a seamless user experience for calculating health metrics, utilizing robust state management for a highly reactive UI.

# 🎥 **App Demo**
___

> 🔗 **Video Demo**
>
> * 

https://github.com/user-attachments/assets/8d51d830-7253-4cab-b815-2534f76c5e57

*

___

# ✨ **Key Features**
___

* **Minimalist UI:** Clean, distraction-free design utilizing smart hint-based text inputs instead of traditional sliders.
* **Dynamic State Management:** Fully powered by `flutter_bloc` (Cubit) for seamless UI updates, strictly separating the business logic from the presentation layer.
* **Instant Validation:** Real-time error handling displaying sleek, floating SnackBars for invalid inputs (e.g., zero or negative weight).
* **Interactive Results:** Engages users by displaying the calculated BMI score and health category inside a beautifully designed, dismissible pop-up Dialog.

# 📁 **Project Structure**
___

The project follows a clean, simplified feature-based architecture to separate the logic layer from the presentation layer:

```text
lib/
 ├── logic/
 │   └── cubit/
 │       ├── bmi_cubit.dart         # Core logic, variables, and BMI calculations
 │       └── bmi_state.dart         # Defines app states (Initial, Calculated, Error)
 │
 ├── presentation/
 │   ├── screens/
 │   │   ├── input_screen.dart      # Main UI for data entry, handling reactive state changes
 │   │   └── result_screen.dart     # Standalone result view (or alternative to the Dialog)
 │   │
 │   └── widgets/
 │       └── custom_input_card.dart # Reusable UI component for Age, Height, and Weight entry
 │
 └── main.dart                      # Application entry point & BlocProvider initialization
