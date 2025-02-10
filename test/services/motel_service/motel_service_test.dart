import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go/core/providers/http/i_http_client.dart';
import 'package:guia_moteis_go/core/services/dtos/motel_response_dto.dart';
import 'package:guia_moteis_go/core/services/motel_service.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  group('MotelService', () {
    late MotelService motelService;
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      motelService = MotelService(httpClient: mockHttpClient);
    });

    test(
        'WHEN create MotelService instance THEN it should be created with success',
        () {
      final mockHttpClient = MockHttpClient();

      final motelService = MotelService(httpClient: mockHttpClient);

      expect(motelService, isNotNull);
      expect(motelService, isA<MotelService>());
    });

    test(
        'WHEN getMotels is called AND request is successful THEN return MotelResponseDTO',
        () async {
      final mockResponse = {
        "sucesso": true,
        "data": {
          "pagina": 1,
          "qtdPorPagina": 10,
          "totalSuites": 0,
          "totalMoteis": 1,
          "raio": 0,
          "maxPaginas": 1,
          "moteis": [
            {
              "fantasia": "",
              "logo": "",
              "bairro": "",
              "distancia": 0,
              "qtdFavoritos": 0,
              "suites": [
                {
                  "nome": "",
                  "qtd": 1,
                  "exibirQtdDisponiveis": true,
                  "fotos": [''],
                  "itens": [
                    {"nome": ''},
                  ],
                  "categoriaItens": [
                    {
                      "nome": "",
                      "icone": "",
                    },
                  ],
                  "periodos": [
                    {
                      "tempoFormatado": "",
                      "tempo": "",
                      "valor": 0,
                      "valorTotal": 0,
                      "temCortesia": false,
                      "desconto": null
                    },
                  ]
                },
              ],
              "qtdAvaliacoes": 0,
              "media": 0,
            }
          ]
        },
        "mensagem": []
      };

      when(() => mockHttpClient.get('')).thenAnswer((_) async => mockResponse);

      final result = await motelService.getMotels();

      expect(result, isA<MotelResponseDTO>());
      expect(result.sucesso, true);
      expect(result.data.moteis.length, 1);

      verify(() => mockHttpClient.get('')).called(1);
    });

    test('WHEN getMotels is called AND request fails THEN throw an exception',
        () async {
      when(() => mockHttpClient.get(''))
          .thenThrow(Exception('Failed to load motels'));

      expect(() async => await motelService.getMotels(),
          throwsA(isA<Exception>()));

      verify(() => mockHttpClient.get('')).called(1);
    });

    test(
        'WHEN getMotels is called AND response is invalid THEN throw an exception',
        () async {
      const invalidResponse = 'Any invalid data here';

      when(() => mockHttpClient.get(''))
          .thenAnswer((_) async => invalidResponse);

      expect(() async => await motelService.getMotels(),
          throwsA(isA<Exception>()));

      verify(() => mockHttpClient.get('')).called(1);
    });
  });
}
