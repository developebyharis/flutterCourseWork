# Flutter Coursework — Course Catalog

**Name:** Muhammad Haris Khan
**Roll No:** 1440
**Section:** C
**Lab Task 6**

A Flutter practice app that builds a simple **Course Catalog** to learn and apply core
Flutter basics: UI construction, forms, navigation, state management, and responsive layouts.

## Features

- **Catalog screen** with a toggle between `ListView.builder` and a responsive `GridView.builder`
  (2 columns on phones, 3 on tablets ≥600px, 4 on desktop ≥900px via `MediaQuery`)
- **Course card widget** re-used across list & grid, with a `Stack` + `Positioned` badge overlay
  for the "NEW" label
- **Detail screen** opened with `Navigator.push` by passing a `Course` object
- **Registration form** with two fields (name, email), `Form`/`GlobalKey` validation,
  and a success `AlertDialog` on submit
- **UI components:** `Drawer` navigation, `showModalBottomSheet` for sorting
  (highest rated / shortest first), `AlertDialog` for the About section
- **Material 3** theming with an indigo color seed
- Component-based folder structure for readability

## Project Structure

```
lab6/
├── lib/
│   ├── main.dart                     # App entry, MaterialApp + theme
│   ├── models/
│   │   └── course.dart               # Course model + sample data (kCourses)
│   ├── screens/
│   │   ├── catalog_screen.dart       # List/grid catalog, drawer, sort sheet, about dialog
│   │   ├── course_details_screen.dart# Full course details
│   │   └── registration_screen.dart  # Validated registration form
│   └── widgets/
│       └── course_card.dart          # Reusable card (list + grid)
├── pubspec.yaml
└── analysis_options.yaml
```

## Getting Started

Prerequisites: [Flutter SDK](https://docs.flutter.dev/get-started/install) (^3.13.3 / Dart SDK).

```bash
cd lab6
flutter pub get
flutter run          # run on a connected device, emulator, or browser
```

Other useful commands:

```bash
flutter analyze      # static analysis (flutter_lints)
flutter test         # run widget tests
```

## Screens

| Screen | Purpose |
| --- | --- |
| Catalog | Browse courses, toggle list/grid, sort, open drawer |
| Course Details | Show full info for a selected course, register button |
| Registration | Collect name + email with validation, success dialog |

## Notes

New syntax is commented inline in the source files to explain the concepts; basics
covered in lecture are left uncommented.
