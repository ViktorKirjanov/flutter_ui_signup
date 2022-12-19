import 'package:flutter_ui_signup/models/auth_response_model.dart';

abstract class AuthDataSource {
  Future<AuthResponse> signUp(String email, String password);
}
