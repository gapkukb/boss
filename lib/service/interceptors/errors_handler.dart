import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'values.dart';

/** 改拦截器会修改返回值，应置于最后设置 */
class ErrorsHandler extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (err is BizException) {
      EasyLoading.showToast(err.message!);
      return;
    }
    final error = format(err);

    if (error.message != null) {
      EasyLoading.showToast(err.toString());
    }

    // TODO: 错误上报
    print(error.debugMessage);
  }
}
