import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3324/models/user_model.dart';
import 'package:flutter_app_3324/services/local/storage_service.dart';
import 'package:flutter_app_3324/viewmodels/base_viewmodel.dart';
import 'package:flutter_app_3324/app/routes/app_routes.dart';

class AuthViewModel extends BaseViewModel {
  final StorageService _storageService = StorageService();
  final Rx<UserModel?> _currentUser = Rx<UserModel?>(null);

  UserModel? get currentUser => _currentUser.value;
  bool get isLoggedIn => currentUser != null && currentUser!.token != null;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  // 检查登录状态
  Future<void> checkLoginStatus() async {
    setLoading(true);
    try {
      final user = await _storageService.getUser();
      if (user != null && user.token != null) {
        _currentUser.value = user;
        setLoading(false);
      } else {
        setLoading(false);
        logout(shouldRedirect: false);
      }
    } catch (e) {
      handleError(e);
      logout(shouldRedirect: false);
    }
  }

  // 设置当前用户
  void setUser(UserModel user) {
    _currentUser.value = user;
    _storageService.saveUser(user);
    if (user.token != null) {
      _storageService.saveToken(user.token!);
    }
  }

  // 登出
  Future<void> logout({bool shouldRedirect = true, BuildContext? context}) async {
    _currentUser.value = null;
    await _storageService.clearAll();
    if (shouldRedirect && context != null && context.mounted) {
      context.go(AppRoutes.login);
    }
  }
}
