import 'package:get/get.dart';
import 'package:flutter_app_3324/app/routes/app_routes.dart';
import 'package:flutter_app_3324/app/bindings/auth_binding.dart';
import 'package:flutter_app_3324/views/auth/login_view.dart';
import 'package:flutter_app_3324/views/home/home_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    // 认证页面
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),

    // 主页
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
  ];
}
