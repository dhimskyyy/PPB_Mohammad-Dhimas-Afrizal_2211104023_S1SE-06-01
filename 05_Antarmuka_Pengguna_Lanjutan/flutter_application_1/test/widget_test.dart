import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Tourist Places List Test', (WidgetTester tester) async {
    // Build the ListViewApp and trigger a frame.
    await tester.pumpWidget(const ListViewApp());

    // Verify that the first tourist place is displayed.
    expect(find.text('Eiffel Tower'), findsOneWidget);
    expect(find.text('Paris, France'), findsOneWidget);

    // Verify that another place is not yet visible before scrolling.
    expect(find.text('Grand Canyon'), findsNothing);

    // Scroll down to reveal the Grand Canyon item.
    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pump();

    // Now verify that the Grand Canyon is visible.
    expect(find.text('Grand Canyon'), findsOneWidget);
    expect(find.text('Arizona, USA'), findsOneWidget);
  });
}
