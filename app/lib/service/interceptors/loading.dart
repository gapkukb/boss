import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../index.dart';

class Loading extends InterceptorsWrapper {
  static var count = 0;
  static void showLoading(Map<String, Object?> extra) {
    if (extra.loading && ++count == 1) {
      EasyLoading.show(status: 'loading...');
    }
  }

  static void hideLoading(Map<String, Object?> extra) {
    if (extra.loading && --count == 0) {
      EasyLoading.dismiss();
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    showLoading(options.extra);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    hideLoading(response.extra);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    hideLoading(err.requestOptions.extra);
    super.onError(err, handler);
  }
}
