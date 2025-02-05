import 'package:get_it/get_it.dart';
import 'package:guia_moteis_go/core/providers/http/http_client.dart';
import 'package:guia_moteis_go/core/providers/http/i_http_client.dart';

final getIt = GetIt.instance;

Future<void> initInjections() async {
  const baseUrl = 'https://www.jsonkeeper.com/b/1IXK';

  getIt.registerLazySingleton<IHttpClient>(
    () => HttpClient(
      baseUrl: baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );
}
