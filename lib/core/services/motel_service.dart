import 'package:guia_moteis_go/core/providers/http/i_http_client.dart';
import 'package:guia_moteis_go/core/services/dtos/motel_response_dto.dart';

class MotelService {
  MotelService({required IHttpClient httpClient}) : _httpClient = httpClient;

  final IHttpClient _httpClient;

  Future<MotelResponseDTO> getMotels() async {
    try {
      final response = await _httpClient.get('');
      return MotelResponseDTO.fromJson(response);
    } catch (e) {
      throw Exception('Failed to load motels: $e');
    }
  }
}
