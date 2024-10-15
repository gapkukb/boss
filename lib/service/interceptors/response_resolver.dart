import 'package:dio/dio.dart';

abstract class ServiceData<T extends dynamic> {
  int get code;
  String get message;
  T get data;
}

class BizException extends DioException {
  BizException({
    required RequestOptions requestOptions,
    required Response response,
    required String? message,
  }) : super(
          requestOptions: requestOptions,
          response: response,
          message: message,
          stackTrace: StackTrace.current,
        );
}

class ResponseResolver extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /**
     * data = {code: 200, message: "success", data: ...}
     */
    final data = response.data as ServiceData?;
    if (data?.code == 200) {
      response.data = data!.data;
      return super.onResponse(response, handler);
    }

    return handler.reject(BizException(
      requestOptions: response.requestOptions,
      response: response,
      message: data?.message,
    ));
  }
}
