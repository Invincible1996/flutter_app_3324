```
lib/
├── app/
│   ├── bindings/
│   │   ├── initial_binding.dart
│   │   ├── auth_binding.dart
│   │   ├── home_binding.dart
│   │   └── message_binding.dart
│   ├── routes/
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   └── theme/
│       ├── app_colors.dart
│       ├── app_theme.dart
│       └── app_text_styles.dart
│
├── models/
│   ├── user_model.dart
│   ├── message_model.dart
│   ├── conversation_model.dart
│   └── notification_model.dart
│
├── services/
│   ├── api/
│   │   ├── base_api_service.dart
│   │   ├── auth_api_service.dart
│   │   ├── user_api_service.dart
│   │   └── message_api_service.dart
│   ├── local/
│   │   ├── storage_service.dart
│   │   └── cache_service.dart
│   └── core/
│       ├── network_service.dart
│       ├── logger_service.dart
│       └── notification_service.dart
│
├── viewmodels/
│   ├── base_viewmodel.dart
│   ├── auth/
│   │   ├── login_viewmodel.dart
│   │   ├── register_viewmodel.dart
│   │   └── auth_viewmodel.dart
│   ├── profile/
│   │   ├── profile_viewmodel.dart
│   │   └── edit_profile_viewmodel.dart
│   └── message/
│       ├── conversations_viewmodel.dart
│       ├── chat_viewmodel.dart
│       └── notifications_viewmodel.dart
│
├── views/
│   ├── auth/
│   │   ├── login_view.dart
│   │   ├── register_view.dart
│   │   └── forgot_password_view.dart
│   ├── profile/
│   │   ├── profile_view.dart
│   │   ├── edit_profile_view.dart
│   │   └── settings_view.dart
│   ├── message/
│   │   ├── conversations_view.dart
│   │   ├── chat_view.dart
│   │   └── notifications_view.dart
│   └── home/
│       └── home_view.dart
│
├── widgets/
│   ├── common/
│   │   ├── loading_widget.dart
│   │   ├── error_widget.dart
│   │   ├── empty_widget.dart
│   │   └── custom_button.dart
│   ├── auth/
│   │   ├── login_form.dart
│   │   └── social_login_buttons.dart
│   ├── profile/
│   │   ├── profile_header.dart
│   │   └── avatar_picker.dart
│   └── message/
│       ├── message_bubble.dart
│       ├── conversation_item.dart
│       └── chat_input.dart
│
├── utils/
│   ├── constants/
│   │   ├── api_endpoints.dart
│   │   ├── app_constants.dart
│   │   └── storage_keys.dart
│   ├── helpers/
│   │   ├── validator.dart
│   │   ├── date_formatter.dart
│   │   └── string_helper.dart
│   └── extensions/
│       ├── string_extensions.dart
│       └── date_extensions.dart
│
├── config/
│   ├── env_config.dart
│   └── app_config.dart
│
└── main.dart
```