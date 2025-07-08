import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:flutter_app_3324/app/routes/app_routes.dart';
import 'package:flutter_app_3324/app/bindings/auth_binding.dart';
import 'package:flutter_app_3324/views/auth/login_view.dart';
import 'package:flutter_app_3324/views/home/home_view.dart';
import 'package:flutter_app_3324/viewmodels/auth/auth_viewmodel.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      // 登录页面
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) {
          // 确保依赖注入
          if (!Get.isRegistered<AuthViewModel>()) {
            AuthBinding().dependencies();
          }
          return const LoginView();
        },
      ),

      // 注册页面
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) {
          // 这里可以创建注册页面
          return const Scaffold(body: Center(child: Text('注册页面')));
        },
      ),

      // 忘记密码页面
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) {
          // 这里可以创建忘记密码页面
          return const Scaffold(body: Center(child: Text('忘记密码页面')));
        },
      ),

      // 主页
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomeView(),
      ),

      // 个人资料页面
      GoRoute(
        path: AppRoutes.profile,
        name: 'profile',
        builder: (context, state) {
          return const Scaffold(body: Center(child: Text('个人资料页面')));
        },
      ),

      // 设置页面
      GoRoute(
        path: AppRoutes.settings,
        name: 'settings',
        builder: (context, state) {
          return const Scaffold(body: Center(child: Text('设置页面')));
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
