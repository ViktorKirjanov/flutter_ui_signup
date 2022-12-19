import 'package:dartz/dartz.dart';
import 'package:flutter_ui_signup/core/errors/failure.dart';
import 'package:flutter_ui_signup/models/auth_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> signUp(String email, String password);
}
