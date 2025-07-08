import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_3324/app/routes/app_pages.dart';
import 'package:flutter_app_3324/app/routes/app_routes.dart';
import 'package:flutter_app_3324/app/bindings/auth_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化全局依赖
  AuthBinding().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
