import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hsinote/component/regular_text_input.dart';

void main() {
  testWidgets('RegularTextInput menampilkan label dan hint', (tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RegularTextInput(
            label: 'Email',
            hintText: 'Masukkan email',
            controller: controller,
          ),
        ),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Masukkan email'), findsOneWidget);
  });

  testWidgets('RegularTextInput bisa diisi', (tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RegularTextInput(
            label: 'Nama',
            hintText: 'Masukkan nama',
            controller: controller,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'Doni');
    expect(controller.text, 'Doni');
  });
}
