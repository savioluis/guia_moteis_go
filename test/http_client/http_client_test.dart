import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go/app/environment_constants.dart';
import 'package:guia_moteis_go/core/providers/http/i_http_client.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements IHttpClient {}

class MockResponse extends Mock implements http.Response {}

void main() {
  group(
    'GIVEN HttpClient instance',
    () {
      late MockHttpClient mockHttpClient;
      late MockResponse mockResponse;
      const baseUrl = EnvironmentConstants.baseUrl;

      setUp(() {
        mockHttpClient = MockHttpClient();
        mockResponse = MockResponse();
      });

      test(
        'WHEN create HttpClient instance THEN it should be created with success',
        () {
          expect(mockHttpClient, isNotNull);
          expect(mockHttpClient, isA<IHttpClient>());
        },
      );

      group(
        'WHEN calling GET method',
        () {
          const headers = {'Authorization': 'Bearer token'};
          const responseBody = 'Any data here';

          setUp(() {
            when(() => mockResponse.statusCode).thenReturn(200);
            when(() => mockResponse.body).thenReturn(responseBody);
            when(() => mockHttpClient.get(baseUrl, headers: headers))
                .thenAnswer((_) async => mockResponse);
          });

          test(
            'THEN it should make a GET request and return the correct data',
            () async {
              final response =
                  await mockHttpClient.get(baseUrl, headers: headers);

              verify(() => mockHttpClient.get(baseUrl, headers: headers))
                  .called(1);

              expect(response.statusCode, 200);
              expect(response.body, responseBody);
            },
          );
        },
      );

      group(
        'WHEN calling POST method',
        () {
          const headers = {'Authorization': 'Bearer token'};
          const requestBody = '{"key": "value"}';
          const responseBody = 'Any data here';

          setUp(() {
            when(() => mockResponse.statusCode).thenReturn(201);
            when(() => mockResponse.body).thenReturn(responseBody);
            when(() => mockHttpClient.post(baseUrl,
                data: requestBody,
                headers: headers)).thenAnswer((_) async => mockResponse);
          });

          test(
            'THEN it should make a POST request and return the correct data',
            () async {
              final response = await mockHttpClient.post(
                baseUrl,
                data: requestBody,
                headers: headers,
              );

              verify(() => mockHttpClient.post(baseUrl,
                  data: requestBody, headers: headers)).called(1);

              expect(response.statusCode, 201);
              expect(response.body, responseBody);
            },
          );
        },
      );

      group(
        'WHEN calling PUT method',
        () {
          const headers = {'Authorization': 'Bearer token'};
          const requestBody = '{"key": "updatedValue"}';
          const responseBody = '{"id": 1, "key": "updatedValue"}';

          setUp(() {
            when(() => mockResponse.statusCode).thenReturn(200);
            when(() => mockResponse.body).thenReturn(responseBody);
            when(() => mockHttpClient.put(baseUrl,
                data: requestBody,
                headers: headers)).thenAnswer((_) async => mockResponse);
          });

          test(
            'THEN it should make a PUT request and return the correct data',
            () async {
              final response = await mockHttpClient.put(
                baseUrl,
                data: requestBody,
                headers: headers,
              );

              verify(() => mockHttpClient.put(baseUrl,
                  data: requestBody, headers: headers)).called(1);

              expect(response.statusCode, 200);
              expect(response.body, responseBody);
            },
          );
        },
      );

      group(
        'WHEN calling DELETE method',
        () {
          const headers = {'Authorization': 'Bearer token'};

          setUp(() {
            when(() => mockResponse.statusCode).thenReturn(204);
            when(() => mockResponse.body).thenReturn('');
            when(() => mockHttpClient.delete(baseUrl, headers: headers))
                .thenAnswer((_) async => mockResponse);
          });

          test(
            'THEN it should make a DELETE request and return the correct status code',
            () async {
              final response =
                  await mockHttpClient.delete(baseUrl, headers: headers);

              verify(() => mockHttpClient.delete(baseUrl, headers: headers))
                  .called(1);

              expect(response.statusCode, 204);
              expect(response.body, isEmpty);
            },
          );
        },
      );

      group(
        'WHEN an error occurs',
        () {
          const headers = {'Authorization': 'Bearer token'};

          setUp(() {
            when(() => mockHttpClient.get(baseUrl, headers: headers)).thenThrow(
              Exception('Failed to load data'),
            );
          });

          test(
            'THEN it should throw an exception',
            () async {
              expect(
                () async => await mockHttpClient.get(baseUrl, headers: headers),
                throwsA(isA<Exception>()),
              );
            },
          );
        },
      );
    },
  );
}
