import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/primary_loading_button.dart';

void main() {
  const primaryLoadingButtonKey = Key('primaryLoadingButtonKey');

  testWidgets('PrimaryLoadingButton has progress indicator', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PrimaryLoadingButton(
            key: primaryLoadingButtonKey,
          ),
        ),
      ),
    );

    expect(find.byKey(primaryLoadingButtonKey), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
