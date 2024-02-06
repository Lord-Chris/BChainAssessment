import '../../../models/_models.dart';

abstract class INetworkService {
  Future<ApiResponse> get(
    String url, {
    Map<String, String>? headers,
  });

  Future<ApiResponse> post(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  });

  Future<ApiResponse> put(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  });

  Future<ApiResponse> delete(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  });

  // Future<ApiResponse> upload();
}
