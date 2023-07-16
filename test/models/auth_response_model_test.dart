import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/models/auth_response_model.dart';

void main() {
  group('AuthResponse', () {
    test('supports value comparison', () {
      expect(
        const AuthResponse(token: 'token'),
        const AuthResponse(token: 'token'),
      );
    });

    test('parse from json', () async {
      expect(
        AuthResponse.fromJson(const {'token': 'token'}),
        const AuthResponse(token: 'token'),
      );
    });
  });
}
