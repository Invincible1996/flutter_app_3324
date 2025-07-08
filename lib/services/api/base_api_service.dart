import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app_3324/utils/constants/api_endpoints.dart';
import 'package:flutter_app_3324/services/local/storage_service.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException: $message (Status Code: $statusCode)';
}

class BaseApiService {
  final http.Client _client = http.Client();
  final StorageService _storageService = StorageService();

  // GET请求
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    try {
      final token = await _storageService.getToken();
      final Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
        if (headers != null) ...headers,
      };

      final response = await _client.get(
        Uri.parse('${ApiEndpoints.baseUrl}$endpoint'),
        headers: requestHeaders,
      );

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('GET请求失败: $e');
    }
  }

  // POST请求
  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final token = await _storageService.getToken();
      final Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
        if (headers != null) ...headers,
      };

      final response = await _client.post(
        Uri.parse('${ApiEndpoints.baseUrl}$endpoint'),
        headers: requestHeaders,
        body: body != null ? json.encode(body) : null,
      );

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('POST请求失败: $e');
    }
  }

  // 处理响应
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return json.decode(response.body);
    } else {
      throw ApiException(response.body, statusCode: response.statusCode);
    }
  }
}
