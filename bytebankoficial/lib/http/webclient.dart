import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data.url);
    print(data.headers);
    print(data.body);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data.statusCode);
    print(data.headers);
    print(data.body);
    return data;
  }

}

void findAll() async{
  final Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client.get(Uri.parse('http://192.168.0.10:8080/transactions'));
}