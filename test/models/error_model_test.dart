import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_signup/models/error_model.dart';

void main() {
  group('ErrorModel', () {
    test('supports value comparison', () {
      expect(
        const ErrorModel(
          statusCode: 403,
          statusMessage: 'Not found',
          success: false,
        ),
        const ErrorModel(
          statusCode: 403,
          statusMessage: 'Not found',
          success: false,
        ),
      );
    });

    test('parse from json', () async {
      expect(
        ErrorModel.fromJson(const {
          'status_code': 403,
          'status_message': 'Not found',
          'success': false,
        }),
        const ErrorModel(
          statusCode: 403,
          statusMessage: 'Not found',
          success: false,
        ),
      );
    });
  });
}
