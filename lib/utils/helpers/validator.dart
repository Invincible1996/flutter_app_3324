class Validator {
  // 验证电子邮件
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return '请输入电子邮件';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return '请输入有效的电子邮件地址';
    }

    return null;
  }

  // 验证密码
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return '请输入密码';
    }

    if (value.length < 6) {
      return '密码长度必须至少为6个字符';
    }

    return null;
  }

  // 验证姓名
  static String? validateName(String value) {
    if (value.isEmpty) {
      return '请输入姓名';
    }

    if (value.length < 2) {
      return '姓名长度必须至少为2个字符';
    }

    return null;
  }

  // 验证确认密码
  static String? validateConfirmPassword(
    String password,
    String confirmPassword,
  ) {
    if (confirmPassword.isEmpty) {
      return '请确认密码';
    }

    if (password != confirmPassword) {
      return '两次输入的密码不一致';
    }

    return null;
  }
}
