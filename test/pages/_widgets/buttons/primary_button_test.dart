import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/primary_button.dart';

void main() {
  const primaryButtonKey = Key('primaryButtonKey');
  const title = 'Title';

  group('PrimaryButton', () {
    testWidgets('is active', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              key: primaryButtonKey,
              title: title,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byKey(primaryButtonKey), findsOneWidget);
      expect(find.text(title), findsOneWidget);
      expect(
        (tester.firstWidget(find.byType(Opacity)) as Opacity).opacity,
        1.0,
      );
    });

    testWidgets('is not active', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              key: primaryButtonKey,
              title: title,
              active: false,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byKey(primaryButtonKey), findsOneWidget);
      expect(find.text(title), findsOneWidget);
      expect((tester.firstWidget(find.byType(Opacity)) as Opacity).opacity, .5);
    });
  });
}
