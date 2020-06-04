import 'package:dio/dio.dart';
import 'package:flutterexerciseapp/network/http_header_config.dart';

class HttpConfig {
  static String BASE_URL = "";
  static HttpConfig _config;

  static HttpConfig get instance => _getInstance();
  Dio dio;

  HttpConfig._internal() {
    var baseOption = BaseOptions(
      connectTimeout: 6000,
      sendTimeout: 3000,
      baseUrl: BASE_URL,
      headers: HttpHeaderConfig.getHeaderConfig(),
    );
    dio = Dio(baseOption);
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (option) {},
        onResponse: (response) {
          if (response.statusCode == 400 || response.statusCode == 404) {}
        },
        onError: (error) {}));
  }

  static HttpConfig _getInstance() {
    if (_config == null) {
      _config = HttpConfig._internal();
    }
    return _config;
  }

  void get<T>(String path,
      {Map<String, dynamic> params,
      Function(T t) onSuccess,
      Function(int error) onError}) async {
    Response response;
    try {
      response = await dio.get(path, queryParameters: params);
      if (response.statusCode == 200 && onSuccess != null) {
        onSuccess(response.data);
      } else if (onError != null) {
        onError(response.statusCode);
      }
    } catch (e) {
      if (onError != null && response != null) {
        onError(-1);
      }
    }
  }

  void post<T>(String path,
      {Map<String, dynamic> data,
      Function(T t) onSuccess,
      Function(int error) onError}) async {
    Response response;
    try {
      response = await dio.post(path, data: data);
      if (response.statusCode == 200 && onSuccess != null) {
        onSuccess(response.data);
      } else if (onError != null) {
        onError(response.statusCode);
      }
    } catch (e) {
      if (onError != null && response != null) {
        onError(-1);
      }
    }
  }
}
