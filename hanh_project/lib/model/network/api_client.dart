import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hanh_project/constants/api_constants.dart';
import 'package:hanh_project/flavors.dart';
import 'package:hanh_project/model/data/results_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

final Provider<Dio> dioProvider = Provider<Dio>(
  (Ref<Dio> ref) => AppDio.getInstance(ref.read),
);

class AppDio with DioMixin implements Dio {
  AppDio({
    BaseOptions? options,
  }) {
    options = BaseOptions(
      baseUrl: Flavor.environment.apiUrl,
      contentType: 'application/json',
      connectTimeout: Duration(seconds: 60),
      sendTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );

    this.options = options;

    interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      // ignore: avoid_print
      logPrint: (log) => print(log),
    ));

    interceptors.add(
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        return handler.next(options);
      }, onError: (DioException e, ErrorInterceptorHandler handler) async {
        if (e.response != null) {
          handler.next(e);
        }
      }),
    );
    httpClientAdapter = IOHttpClientAdapter();
  }

  static Dio getInstance(reader) => AppDio();
}

final Provider<ApiClient> apiClientProvider =
    Provider<ApiClient>((Ref<ApiClient> ref) => ApiClient(ref.read));

@RestApi()
abstract class ApiClient {
  factory ApiClient(reader) => _ApiClient(reader(dioProvider));

  @GET(ApiConstants.popular)
  Future<ResultsResponse> resultsResponse({
    @Query('api_key') String apiKey = ApiConstants.apiKey,
    @Query('language') String language = ApiConstants.language,
  });
}
