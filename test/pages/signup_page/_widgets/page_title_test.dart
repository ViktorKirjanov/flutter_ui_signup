import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/page_title.dart';

void main() {
  testWidgets('is active', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PageTitle(),
        ),
      ),
    );

    expect(find.text('Create an Account'), findsOneWidget);
  });
}
