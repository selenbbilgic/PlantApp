// test/presentation/widgets/primary_button_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/core/widgets/primary_button.dart';

void main() {
  testWidgets('PrimaryButton displays label and reacts to tap', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButton(
            label: 'Press me',
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    // verify label is rendered
    expect(find.text('Press me'), findsOneWidget);

    // tap it
    await tester.tap(find.byType(PrimaryButton));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });
}
