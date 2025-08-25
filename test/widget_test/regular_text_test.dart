import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hsinote/component/regular_text.dart';

void main() {
  testWidgets('RegularText menampilkan teks yang diberikan', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: RegularText('Hello'))),
    );

    expect(find.text('Hello'), findsOneWidget);
  });
}
