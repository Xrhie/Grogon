// Basic widget tests for Grogon app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grogon/app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const GrogonApp());
    expect(find.text('450 XP'), findsOneWidget);
    expect(find.text('Menu'), findsOneWidget);
  });

  testWidgets('Small mobile viewport (360x640) - content scrollable without overflow', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const GrogonApp());
    await tester.pumpAndSettle();

    expect(find.text('450 XP'), findsOneWidget);
    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Dasar Komputer'), findsOneWidget);

    final scrollableFinder = find.byType(Scrollable).first;
    await tester.scrollUntilVisible(
      find.text('TURNAMEN'),
      100.0,
      scrollable: scrollableFinder,
    );
    await tester.pumpAndSettle();

    expect(find.text('TURNAMEN'), findsOneWidget);
  });

  testWidgets('Standard mobile viewport (390x844) - entire content visible', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const GrogonApp());
    await tester.pumpAndSettle();

    expect(find.text('450 XP'), findsOneWidget);
    expect(find.text('TURNAMEN'), findsOneWidget);
    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Peringkat'), findsOneWidget);
    expect(find.text('Profil'), findsOneWidget);
  });
}
