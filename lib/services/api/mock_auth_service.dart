import 'package:flutter_app_3324/models/user_model.dart';

class MockAuthService {
  // 模拟用户数据
  static const Map<String, String> _mockUsers = {
    'test@example.com': '123456',
    'user@test.com': 'password',
    'admin@app.com': 'admin123',
  };

  // 模拟登录
  Future<UserModel> login(String email, String password) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 1));

    // 检查用户是否存在且密码正确
    if (_mockUsers.containsKey(email) && _mockUsers[email] == password) {
      // 返回模拟用户数据
      return UserModel(
        id: 1,
        name: _getUserNameFromEmail(email),
        email: email,
        token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
      );
    } else {
      throw Exception('用户名或密码错误');
    }
  }

  // 模拟注册
  Future<UserModel> register(String name, String email, String password) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 1));

    // 检查用户是否已存在
    if (_mockUsers.containsKey(email)) {
      throw Exception('该邮箱已被注册');
    }

    // 返回新注册的用户数据
    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch,
      name: name,
      email: email,
      token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  // 模拟忘记密码
  Future<void> forgotPassword(String email) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 1));

    // 检查邮箱是否存在
    if (!_mockUsers.containsKey(email)) {
      throw Exception('该邮箱未注册');
    }

    // 模拟发送重置密码邮件成功
    // 实际应用中这里会发送邮件
  }

  // 从邮箱提取用户名
  String _getUserNameFromEmail(String email) {
    final parts = email.split('@');
    return parts.isNotEmpty ? parts[0] : '用户';
  }

  // 获取所有模拟用户（用于测试）
  static Map<String, String> get mockUsers => _mockUsers;
}
