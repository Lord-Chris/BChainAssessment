abstract class INetworkService {
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> post(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> put(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> delete(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  });

  // Future<ApiResponse> upload();
}
