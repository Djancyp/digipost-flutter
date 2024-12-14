import 'dart:convert';
import 'package:digipost/core/services/httpClient.dart';
import 'package:digipost/env/env.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  final client = HttpClient();
  Future<http.Response> login(String username, String password) async {
    final response = await client.post(
      '${Env.baseUrl}/api/login',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': username, 'password': password}),
    );
    return response;
  }

  Future<http.Response> createContact(Object body) async {
    final response = await client.post(
      '${Env.baseUrl}/api/register',
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    return response;
  }

  Future<http.Response> forgotPassword(Object body) async {
    final response = await client.post(
      '${Env.baseUrl}/api/forgot-password',
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    return response;
  }
}
