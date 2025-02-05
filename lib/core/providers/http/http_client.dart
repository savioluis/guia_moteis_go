import 'dart:convert';
import 'package:guia_moteis_go/core/providers/http/i_http_client.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IHttpClient {
  final String baseUrl;
  final Map<String, String> defaultHeaders;
  final int connectTimeout;
  final int receiveTimeout;

  HttpClient({
    required this.baseUrl,
    Map<String, String>? headers,
    this.connectTimeout = 30000,
    this.receiveTimeout = 30000,
  }) : defaultHeaders = headers ?? {};

  Uri _buildUri(String path, [Map<String, dynamic>? queryParameters]) {
    final uri = Uri.parse('$baseUrl$path');
    if (queryParameters != null) {
      return uri.replace(
          queryParameters: queryParameters
              .map((key, value) => MapEntry(key, value.toString())));
    }
    return uri;
  }

  T? _handleResponse<T>(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Erro na requisição: ${response.statusCode} - ${response.body}');
    }
  }

  @override
  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(path, queryParameters);
      final response =
          await http.get(uri, headers: {...defaultHeaders, ...?headers});
      return _handleResponse(response) as T?;
    } catch (e) {
      throw Exception('Erro no GET: $e');
    }
  }

  @override
  Future<T?> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final uri = _buildUri(path, queryParameters);
      final response = await http.post(
        uri,
        headers: {
          ...defaultHeaders,
          ...?headers,
        },
        body: jsonEncode(data),
      );
      return _handleResponse(response) as T?;
    } catch (e) {
      throw Exception('Erro no POST: $e');
    }
  }

  @override
  Future<T?> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final uri = _buildUri(path, queryParameters);
      final response = await http.put(
        uri,
        headers: {
          ...defaultHeaders,
          ...?headers,
        },
        body: jsonEncode(data),
      );
      return _handleResponse(response) as T?;
    } catch (e) {
      throw Exception('Erro no PUT: $e');
    }
  }

  @override
  Future<T?> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final uri = _buildUri(path, queryParameters);
      final response = await http.delete(
        uri,
        headers: {
          ...defaultHeaders,
          ...?headers,
        },
        body: data != null ? jsonEncode(data) : null,
      );
      return _handleResponse(response) as T?;
    } catch (e) {
      throw Exception('Erro no DELETE: $e');
    }
  }

  @override
  Future<T?> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final uri = _buildUri(path, queryParameters);
      final response = await http.patch(
        uri,
        headers: {
          ...defaultHeaders,
          ...?headers,
        },
        body: jsonEncode(data),
      );
      return _handleResponse(response) as T?;
    } catch (e) {
      throw Exception('Erro no PATCH: $e');
    }
  }
}
