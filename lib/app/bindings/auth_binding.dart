import 'package:get/get.dart';
import 'package:flutter_app_3324/viewmodels/auth/auth_viewmodel.dart';
import 'package:flutter_app_3324/viewmodels/auth/login_viewmodel.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // 注册认证视图模型
    Get.lazyPut<AuthViewModel>(() => AuthViewModel(), fenix: true);

    // 注册登录视图模型
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}
