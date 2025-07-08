import 'package:get/get.dart';

class BaseViewModel extends GetxController {
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  // 设置加载状态
  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  // 设置错误信息
  void setError(String message) {
    _errorMessage.value = message;
  }

  // 清除错误信息
  void clearError() {
    _errorMessage.value = '';
  }

  // 处理API错误
  void handleError(dynamic error) {
    setLoading(false);
    if (error is String) {
      setError(error);
    } else {
      setError('发生错误，请稍后重试');
    }
    print('Error: $error');
  }
}
