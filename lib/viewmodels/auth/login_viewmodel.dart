import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3324/services/api/auth_api_service.dart';
import 'package:flutter_app_3324/viewmodels/base_viewmodel.dart';
import 'package:flutter_app_3324/viewmodels/auth/auth_viewmodel.dart';
import 'package:flutter_app_3324/app/routes/app_routes.dart';
import 'package:flutter_app_3324/utils/helpers/validator.dart';

class LoginViewModel extends BaseViewModel {
  final AuthApiService _authApiService = AuthApiService();
  final AuthViewModel _authViewModel = Get.find<AuthViewModel>();

  final RxString email = 'test@example.com'.obs;
  final RxString password = '123456'.obs;

  final RxBool rememberMe = false.obs;
  final RxBool passwordVisible = false.obs;

  // 电子邮件验证
  String? validateEmail(String value) {
    return Validator.validateEmail(value);
  }

  // 密码验证
  String? validatePassword(String value) {
    return Validator.validatePassword(value);
  }

  // 切换密码可见性
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  // 切换记住我
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  // 登录
  Future<void> login(BuildContext context) async {
    print('开始登录流程');
    
    if (email.value.isEmpty || password.value.isEmpty) {
      setError('请输入电子邮件和密码');
      return;
    }

    final emailError = validateEmail(email.value);
    if (emailError != null) {
      setError(emailError);
      return;
    }

    final passwordError = validatePassword(password.value);
    if (passwordError != null) {
      setError(passwordError);
      return;
    }

    clearError();
    setLoading(true);
    print('开始API调用');

    try {
      final user = await _authApiService.login(email.value, password.value);
      print('登录成功，用户: ${user.email}');
      
      _authViewModel.setUser(user);
      setLoading(false);
      
      print('准备导航到主页');
      
      if (context.mounted) {
        context.go(AppRoutes.home);
        print('导航命令已发送');
      }
    } catch (e) {
      print('登录失败: $e');
      handleError(e);
    }
  }

  // 导航到注册页面
  void goToRegister(BuildContext context) {
    if (context.mounted) {
      context.go(AppRoutes.register);
    }
  }

  // 导航到忘记密码页面
  void goToForgotPassword(BuildContext context) {
    if (context.mounted) {
      context.go(AppRoutes.forgotPassword);
    }
  }
}
