import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:praktikum4/main.dart';

void main() {
  testWidgets('ListViewApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ListViewApp());

    // Verify that the title "Recommended Tourist Places" is present.
    expect(find.text('Recommended Tourist Places'), findsOneWidget);

    // Verify the presence of one of the tourist places, for example, "Eiffel Tower".
    expect(find.text('Eiffel Tower'), findsOneWidget);

    // Scroll through the ListView to make sure it works.
    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pump();

    // Verify another place becomes visible after scrolling.
    expect(find.text('Colosseum'), findsOneWidget);
  });
}
