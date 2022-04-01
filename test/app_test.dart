// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cornell_notes/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cornell_notes/main.dart';

void main() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('cornell.notes').build();
  final dao = database.cadernoDao;
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CornellNotes(dao));

    expect(find.text('Test'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    tester.enterText(find.byKey(const Key('titulo')), 'Test');
    expect(find.text('1'), findsOneWidget);
  });
}
