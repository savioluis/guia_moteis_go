import 'package:get_it/get_it.dart';
import 'package:guia_moteis_go/app/environment_constants.dart';
import 'package:guia_moteis_go/core/providers/http/http_client.dart';
import 'package:guia_moteis_go/core/providers/http/i_http_client.dart';
import 'package:guia_moteis_go/core/services/motel_service.dart';

final getIt = GetIt.instance;

Future<void> initInjections() async {
  const baseUrl = EnvironmentConstants.baseUrl;

  getIt.registerLazySingleton<IHttpClient>(
    () => HttpClient(
      baseUrl: baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  getIt.registerLazySingleton(
    () => MotelService(
      httpClient: getIt(),
    ),
  );
}
