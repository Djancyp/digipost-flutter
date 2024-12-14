import 'package:http/http.dart' as http;

class HttpClient {
  static final HttpClient _instance = HttpClient._internal();
  factory HttpClient() => _instance;

  final http.Client _client = http.Client();
  final Map<String, String> _headers = {};

  HttpClient._internal();

  Future<http.Response> post(String url,
      {Map<String, String>? headers, Object? body}) async {
    final response = await _client.post(
      Uri.parse(url),
      headers: {..._headers, ...?headers},
      body: body,
    );
    _updateHeaders(response);
    return response;
  }

  Future<http.Response> get(String url, {Map<String, String>? headers}) async {
    final response = await _client.get(
      Uri.parse(url),
      headers: {..._headers, ...?headers},
    );
    _updateHeaders(response);
    return response;
  }

  Future<http.Response> put(String url,
      {Map<String, String>? headers, Object? body}) async {
    final response = await _client.put(
      Uri.parse(url),
      headers: {..._headers, ...?headers},
      body: body,
    );
    _updateHeaders(response);
    return response;
  }

  void _updateHeaders(http.Response response) {
    if (response.headers['set-cookie'] != null) {
      _headers['Cookie'] = response.headers['set-cookie']!;
    }
  }
}
