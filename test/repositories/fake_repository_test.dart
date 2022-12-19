import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/core/errors/failure.dart';
import 'package:flutter_ui_signup/core/errors/network_exception.dart';
import 'package:flutter_ui_signup/data/datasources/auth_data_source.dart';
import 'package:flutter_ui_signup/data/repository/fake_repository.dart';
import 'package:flutter_ui_signup/models/auth_response_model.dart';
import 'package:mocktail/mocktail.dart';

import '../consts.dart';

class MockAuthDataSource extends Mock implements AuthDataSource {}

void main() {
  registerFallbackValue(Uri());
  late FakeAuthRepository repository;
  late AuthDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockAuthDataSource();
    repository = FakeAuthRepository(authDataSource: mockDataSource);
  });

  final error = DioError(
    response: Response(
      data: {
        'status_code': 403,
        'status_message': 'Can not create an account',
        'success': false
      },
      statusCode: 403,
      requestOptions: RequestOptions(path: ''),
    ),
    type: DioErrorType.response,
    requestOptions: RequestOptions(path: ''),
  );

  final networkException = NetworkException.getDioException(error);

  test(
    'should return remote data when the call to remote data source is successful',
    () async {
      // arrange
      when(() => mockDataSource.signUp(any(), any()))
          .thenAnswer((_) async => authResponse);
      // act
      final result = await repository.signUp('test@example.com', 'password123');
      // assert
      verify(() => mockDataSource.signUp('test@example.com', 'password123'));
      expect(
        result,
        equals(const Right<NetworkFailure, AuthResponse>(authResponse)),
      );
    },
  );

  test(
    'should return server failure when the call to remote data source is unsuccessful',
    () async {
      // arrange
      when(() => mockDataSource.signUp(any(), any())).thenThrow(error);
      // act
      final result = await repository.signUp('test@example.com', 'password123');
      // assert
      verify(() => mockDataSource.signUp('test@example.com', 'password123'));
      expect(
        result,
        equals(
          Left<NetworkFailure, AuthResponse>(
            NetworkFailure(networkException),
          ),
        ),
      );
    },
  );
}
