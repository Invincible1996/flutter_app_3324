import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_3324/viewmodels/auth/auth_viewmodel.dart';
import 'package:flutter_app_3324/widgets/common/ticket_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Get.find<AuthViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('首页'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authViewModel.logout(),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TicketWidget(
                width: double.infinity,
                height: 220,
                color: Colors.white,
                cutoutPosition: 130,
                hasBorder: true,
                borderColor: Colors.grey.shade300,
                hasShadow: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '欢迎回来',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      final user = authViewModel.currentUser;
                      return Text(
                        '${user?.name ?? '用户'}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black54,
                        ),
                      );
                    }),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // 导航到个人资料页面
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('查看个人资料'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              TicketWidget(
                width: double.infinity,
                height: 220,
                color: Colors.white,
                cutoutPosition: 130,
                hasBorder: true,
                borderColor: Colors.grey.shade300,
                hasShadow: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '欢迎回来',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      final user = authViewModel.currentUser;
                      return Text(
                        '${user?.name ?? '用户'}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black54,
                        ),
                      );
                    }),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // 导航到个人资料页面
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('查看个人资料'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
