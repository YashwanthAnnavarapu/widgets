import 'package:dio/dio.dart';

import '../local/shared_prefs.dart';
import 'api_client.dart';
import 'custom_cache_interceptor.dart';
import 'pretty_dio_logger.dart';

class DioClient implements ApiClient {
  late Dio dio;
  String accessToken = "Bearer fiakb9318uishfsksn5oibbynn86gb3w";
  String baseUrl = 'https://google.com/';
  String mapsKey = 'AIzaSyBTQ-RrVQbGz2ymNmdSkenm8vlkVR8Q_ec';

  DioClient() {
    dio = Dio();
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10000),
      receiveTimeout: const Duration(seconds: 10000),
    );

    dio.interceptors
      ..add(CacheInterceptor())
      ..add(
        PrettyDioLogger(
          maxWidth: 80,
          error: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          compact: true,
        ),
      );
  }

  Future<Options> getOptions({String? t}) async {
    Map<String, dynamic> headers = {'Accept': 'application/json'};
    var token = t ?? await Prefs.getToken() ?? accessToken ?? '';
    var tenantId = t ?? await Prefs.getTenantId() ?? '';
    var hostelId = t ?? await Prefs.getHostelId() ?? '';
    headers['Authorization'] = token;
    headers['tenantId'] = tenantId;
    headers['hostelId'] = hostelId;
    headers['Content-Type'] = 'application/json';
    print('##Headers##');
    print(headers);
    return Options(
      headers: headers,
      responseType: ResponseType.json,
    );
  }

  @override
  Future delete(String path, {body, query, t}) async {
    var response = await dio.delete(
      path,
      data: body,
      queryParameters: query,
      options: await getOptions(t: t),
    );
    return response.data;
  }

  @override
  Future get(String path, {query, Options? options, t}) async {
    var response = await dio.get(
      path,
      queryParameters: query,
      options: options ?? await getOptions(t: t),
    );
    return response.data;
  }

  @override
  Future patch(String path, body, {query}) async {
    var response = await dio.patch(
      path,
      data: body,
      queryParameters: query,
      options: await getOptions(),
    );
    return response.data;
  }

  @override
  Future post(String path, body, {query, t}) async {
    var response = await dio.post(
      path,
      data: body,
      queryParameters: query,
      options: await getOptions(t: t),
    );
    return response.data;
  }

  @override
  Future put(String path, body, {query, t}) async {
    var response = await dio.put(
      path,
      data: body,
      queryParameters: query,
      options: await getOptions(t: t),
    );
    return response.data;
  }
}
