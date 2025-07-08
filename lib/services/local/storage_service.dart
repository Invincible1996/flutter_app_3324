import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_app_3324/utils/constants/storage_keys.dart';
import 'package:flutter_app_3324/models/user_model.dart';

class StorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // 保存用户信息
  Future<void> saveUser(UserModel user) async {
    await _storage.write(
      key: StorageKeys.user,
      value: jsonEncode(user.toJson()),
    );
  }

  // 获取用户信息
  Future<UserModel?> getUser() async {
    final userStr = await _storage.read(key: StorageKeys.user);
    if (userStr != null) {
      return UserModel.fromJson(jsonDecode(userStr));
    }
    return null;
  }

  // 保存令牌
  Future<void> saveToken(String token) async {
    await _storage.write(key: StorageKeys.token, value: token);
  }

  // 获取令牌
  Future<String?> getToken() async {
    return await _storage.read(key: StorageKeys.token);
  }

  // 清除所有数据
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  // 检查用户是否已登录
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
