import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_3324/viewmodels/auth/login_viewmodel.dart';
import 'package:flutter_app_3324/widgets/auth/login_form.dart';
import 'package:flutter_app_3324/widgets/common/loading_widget.dart';

class LoginView extends GetView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading) {
            return const LoadingWidget();
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  // 标题
                  Text(
                    '欢迎回来',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // 副标题
                  Text(
                    '请登录您的账号',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),

                  const SizedBox(height: 40),

                  // 登录表单
                  LoginForm(controller: controller),

                  const SizedBox(height: 16),

                  // 错误信息
                  Obx(() {
                    if (controller.errorMessage.isNotEmpty) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          controller.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),

                  const SizedBox(height: 24),

                  // 注册链接
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('还没有账号？'),
                      TextButton(
                        onPressed: () => controller.goToRegister(context),
                        child: const Text('立即注册'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
