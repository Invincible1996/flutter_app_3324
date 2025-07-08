import 'package:flutter_app_3324/models/user_model.dart';
import 'package:flutter_app_3324/services/api/base_api_service.dart';
import 'package:flutter_app_3324/services/api/mock_auth_service.dart';
import 'package:flutter_app_3324/utils/constants/api_endpoints.dart';

class AuthApiService extends BaseApiService {
  final MockAuthService _mockAuthService = MockAuthService();
  
  // 是否使用模拟模式 - 在开发环境中设为true
  static const bool _useMockMode = true;

  // 登录
  Future<UserModel> login(String email, String password) async {
    if (_useMockMode) {
      // 使用模拟登录
      return await _mockAuthService.login(email, password);
    } else {
      // 使用真实API
      try {
        final response = await post(
          ApiEndpoints.login,
          body: {'email': email, 'password': password},
        );

        return UserModel.fromJson(response);
      } catch (e) {
        rethrow;
      }
    }
  }

  // 注册
  Future<UserModel> register(String name, String email, String password) async {
    if (_useMockMode) {
      // 使用模拟注册
      return await _mockAuthService.register(name, email, password);
    } else {
      // 使用真实API
      try {
        final response = await post(
          ApiEndpoints.register,
          body: {'name': name, 'email': email, 'password': password},
        );

        return UserModel.fromJson(response);
      } catch (e) {
        rethrow;
      }
    }
  }

  // 忘记密码
  Future<void> forgotPassword(String email) async {
    if (_useMockMode) {
      // 使用模拟忘记密码
      return await _mockAuthService.forgotPassword(email);
    } else {
      // 使用真实API
      try {
        await post(ApiEndpoints.forgotPassword, body: {'email': email});
      } catch (e) {
        rethrow;
      }
    }
  }
}
