import 'package:flutter_ui_signup/data/datasources/auth_data_source.dart';
import 'package:flutter_ui_signup/data/datasources/auth_data_source_mock.dart';
import 'package:flutter_ui_signup/data/repository/auth_repository.dart';
import 'package:flutter_ui_signup/data/repository/auth_repository_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt

    // Repository
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: getIt()),
    )

    // Data source
    ..registerLazySingleton<AuthDataSource>(AuthDataSourceMock.new);
}
