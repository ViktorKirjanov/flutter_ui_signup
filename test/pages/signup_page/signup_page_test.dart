import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/bloc/signup_cubit/signup_cubit.dart';
import 'package:flutter_ui_signup/data/repository/auth_repository.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/close_button.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/email_input.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/have_account_button.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/later_button.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/page_title.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/password_input.dart';
import 'package:flutter_ui_signup/pages/signup_page/_widgets/signup_button.dart';
import 'package:flutter_ui_signup/pages/signup_page/signup_page.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock implements AuthRepository {}

class MockSignUpCubit extends MockCubit<SignUpState> implements SignUpCubit {}

void main() {
  const signupPageKey = Key('signupPageKey');

  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group('SignupPage.', () {
    testWidgets('Finds SignupPage widgets.', (WidgetTester tester) async {
      await binding.setSurfaceSize(const Size(390, 844));

      await tester.pumpWidget(
        RepositoryProvider<AuthRepository>(
          create: (_) => MockAuthenticationRepository(),
          child: const MaterialApp(
            home: SignUpPage(key: signupPageKey),
          ),
        ),
      );

      expect(find.byType(CloseAppbarButton), findsOneWidget);
      expect(find.byType(LaterButton), findsOneWidget);
      expect(find.byType(PageTitle), findsOneWidget);
      expect(find.byType(EmailInput), findsOneWidget);
      expect(find.byType(PasswordInput), findsOneWidget);
      expect(find.byType(SignUpButton), findsOneWidget);
      expect(find.byType(HaveAccountButton), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
      expect(find.byKey(const Key('googleSocialButton')), findsOneWidget);
      expect(find.byKey(const Key('facebookSocialButton')), findsOneWidget);
      expect(find.byKey(const Key('appleSocialButton')), findsOneWidget);
    });
  });
}
