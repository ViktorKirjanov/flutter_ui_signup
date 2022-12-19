import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/pages/_widgets/buttons/secondary_button.dart';

void main() {
  const secondaryButtonKey = Key('secondaryButtonKey');
  const title = 'Title';

  group('SecondaryButton', () {
    testWidgets('is active', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SecondaryButton(
              key: secondaryButtonKey,
              title: title,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byKey(secondaryButtonKey), findsOneWidget);
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
            body: SecondaryButton(
              key: secondaryButtonKey,
              title: title,
              active: false,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byKey(secondaryButtonKey), findsOneWidget);
      expect(find.text(title), findsOneWidget);
      expect((tester.firstWidget(find.byType(Opacity)) as Opacity).opacity, .5);
    });
  });
}
