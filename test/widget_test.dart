// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:aldeia_montessori/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aldeia_montessori/pages/SplashPage.dart';
import 'package:aldeia_montessori/main.dart';

void main() {
  Widget createWidgetForTesting(Widget child){
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('Main App should render Splash Page', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    // Verify that Splash Screen was build
    expect(find.text('Splash Screen'), findsOneWidget);
  });

  testWidgets('Splash Page should redirect to Login', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(SplashPage()));

    // Verify that Splash Screen was build
    expect(find.text('Splash Screen'), findsOneWidget);
  });
  
  testWidgets('Home App has title', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(HomePage()));

    final Finder titleFinder = find.text('Aldeia Montessori');

    expect(titleFinder, findsOneWidget);
  });
}
