import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ui_signup/core/errors/failure.dart';
import 'package:flutter_ui_signup/core/errors/network_exception.dart';
import 'package:flutter_ui_signup/data/datasources/auth_data_source.dart';
import 'package:flutter_ui_signup/data/repository/auth_repository.dart';
import 'package:flutter_ui_signup/models/auth_response_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required AuthDataSource authDataSource}) : _authDataSource = authDataSource;

  final AuthDataSource _authDataSource;

  @override
  Future<Either<Failure, AuthResponse>> signUp(
    String email,
    String password,
  ) async {
    try {
      final authResponse = await _authDataSource.signUp(email, password);
      return Right(authResponse);
    } on DioError catch (e) {
      final exeption = NetworkException.getDioException(e);
      return Left(NetworkFailure(exeption));
    } catch (_) {
      return Left(NetworkFailure(const NetworkException.unexpectedError()));
    }
  }
}
