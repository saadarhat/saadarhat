import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../app/core/services/env_service.dart';

class SubscriptionService {
  SubscriptionService(this._dio, this._storage);

  final Dio _dio;
  final FlutterSecureStorage _storage;

  Future<Map<String, dynamic>> fetchSubscription() async {
    final token = await _storage.read(key: 'id_token');
    final response = await _dio.get(
      '${EnvService.apiBaseUrl}/subscription/status',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response.data as Map<String, dynamic>;
  }

  Future<void> createCheckoutSession() async {}

  Future<void> openNativeSubscriptionManager() async {}
}
