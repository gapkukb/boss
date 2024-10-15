import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'response_resolver.dart';

class ErrorsHandler extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    String? message;

    if (err is BizException) {
      if (!err.message!.isEmpty) {
        message = err.message!;
      }
    } else {
      message = err.response!.statusCode == 401
          ? 'Unauthorized'
          : 'Something went wrong';
    }

    if (message != null) {
      EasyLoading.showToast(err.message!);
    }
  }
}
