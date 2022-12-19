import 'package:dio/dio.dart';
import 'package:flutter_ui_signup/data/datasources/auth_data_source.dart';
import 'package:flutter_ui_signup/models/auth_response_model.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class MockDataSource extends AuthDataSource {
  @override
  Future<AuthResponse> signUp(String email, String password) async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);

    const signInRoute = '/signup';
    const fakeEmail = 'test@example.com';
    const fakePassword = 'password123';
    const accessToken = <String, dynamic>{
      'token': 'ACCESS_TOKEN',
    };

    dioAdapter.onPost(
      signInRoute,
      (server) => server.reply(200, accessToken),
      data: {
        'email': fakeEmail,
        'password': fakePassword,
      },
    );

    await Future<void>.delayed(const Duration(seconds: 1));
    if (email == fakeEmail && password == fakePassword) {
      final Response<dynamic> response = await dio.post(
        signInRoute,
        data: {
          'email': email,
          'password': password,
        },
      );
      return AuthResponse.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw DioError(
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
    }
  }
}
