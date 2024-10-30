import 'package:dio/dio.dart';

import 'values.dart';

abstract class ServiceResponse<T extends dynamic> {
  int get code;
  String get message;
  T get data;
}

class ResponseResolver extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /**
     * data = {code: 200, message: "success", data: ...}
     */
    final data = response.data as ServiceResponse?;
    if (data?.code == 200) {
      response.data = data!.data;
      return super.onResponse(response, handler);
    }

    return handler.reject(BizException(
      code: data?.code,
      message: data?.message,
      requestOptions: response.requestOptions,
      response: response,
    ));
  }
}
