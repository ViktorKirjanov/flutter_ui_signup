import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_signup/bloc/bloc_observer.dart';
import 'package:flutter_ui_signup/config/custom_theme.dart';
import 'package:flutter_ui_signup/data/datasources/mock_data_source.dart';
import 'package:flutter_ui_signup/data/repository/auth_repository.dart';
import 'package:flutter_ui_signup/data/repository/fake_repository.dart';
import 'package:flutter_ui_signup/pages/signup_page/signup_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Bloc.observer = AppBlocObserver();

  runApp(
    MyApp(
      authRepository: FakeAuthRepository(
        authDataSource: MockDataSource(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>.value(
            value: _authRepository,
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: ThemeMode.light,
          theme: CustomTheme.lightTheme,
          home: const SignUpPage(),
        ),
      );
}
