import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_3324/viewmodels/auth/login_viewmodel.dart';

class LoginForm extends StatelessWidget {
  final LoginViewModel controller;
  const LoginForm({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 创建TextEditingController并设置默认值
    final emailController = TextEditingController(text: controller.email.value);
    final passwordController = TextEditingController(text: controller.password.value);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: '邮箱',
            prefixIcon: Icon(Icons.email),
          ),
          onChanged: (value) => controller.email.value = value,
        ),
        const SizedBox(height: 16),
        Obx(
          () => TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: '密码',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.passwordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
            ),
            obscureText: !controller.passwordVisible.value,
            onChanged: (value) => controller.password.value = value,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.rememberMe.value,
                onChanged: (value) => controller.toggleRememberMe(),
              ),
            ),
            const Text('记住我'),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => controller.login(context),
            child: const Text('登录'),
          ),
        ),
      ],
    );
  }
}
