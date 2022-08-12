import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    if (kDebugMode) {
      print(data.url);
    }
    if (kDebugMode) {
      print(data.headers);
    }
    if (kDebugMode) {
      print(data.body);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (kDebugMode) {
      print(data.statusCode);
    }
    if (kDebugMode) {
      print(data.headers);
    }
    if (kDebugMode) {
      print(data.body);
    }
    return data;
  }
}
