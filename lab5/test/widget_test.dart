import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:student_profile_dashboard/main.dart';

void main() {
  testWidgets('Dashboard builds without overflow on a small phone',
      (WidgetTester tester) async {
    // Simulate a very small phone (320 x 480 logical pixels).
    tester.view.physicalSize = const Size(320 * 3, 480 * 3);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Overflow errors are reported through FlutterError - the test fails
    // automatically if any RenderFlex overflow happens.
    expect(tester.takeException(), isNull);

    // Basic content checks.
    expect(find.text('Muhammad Haris Khan'), findsOneWidget);
    expect(find.text('Personal Information'), findsOneWidget);
    expect(find.text('Academic Information'), findsOneWidget);
    expect(find.text('Contact Information'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Save'), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, 'Contact'), findsOneWidget);
  });

  testWidgets('Page scrolls to reveal the bottom buttons',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(320 * 3, 480 * 3);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());

    // Buttons are below the fold on a small screen - scroll to them.
    await tester.scrollUntilVisible(
      find.widgetWithText(ElevatedButton, 'Save'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    expect(find.widgetWithText(ElevatedButton, 'Save'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
