import 'package:dio/dio.dart';

final _httpMessage = Map<int, String>.from({
  400: '客户端请求错误',
  401: '请先登录',
  403: '用户未授权',
  404: '请求的资源不存在',
  405: '不允许的请求方法',
  406: '服务器拒绝了请求',
  407: '请使用代理进行授权',
  //等待客户端发送的请求时间过长
  408: '服务器等待客户端超时',
  409: '请求冲突',
  410: '访问的资源已被永久移除',
  411: '请求信息缺失"Content-Length"',
  412: '请求信息前提条件失败',
  413: '请求实体过大，服务器拒绝了请求',
  414: '请求的URI过长，服务器拒绝了请求',
  415: '不支持的媒体类型',
  418: 'I\'m a teapot',
  420: '请求频繁，请稍后再试',
  422: '请求格式正确，但是由于含有语义错误，无法响应',
  423: '当前资源被锁定',
  426: '客户端应当切换到TLS/1.0',
  427: '服务器要求客户端对请求进行身份验证',
  428: '要求先决条件',
  429: '请求过多',
  431: '请求头字段太大',
  500: '服务器内部错误',
  501: '服务器不支持请求的功能',
  502: '网关错误',
  503: '服务器暂时不可用',
  504: '网关超时',
  505: '服务器不支持请求的HTTP协议的版本',
});

final _bizMessage = Map<int, String>.from({
  1000: '余额不足',
  1001: '用户名密码错误',
});

class BizException extends DioException {
  final int code;

  BizException({
    int? code,
    required RequestOptions requestOptions,
    required Response response,
    required String? message,
  })  : this.code = code ?? -1,
        super(
          requestOptions: requestOptions,
          response: response,
          message: message,
          stackTrace: StackTrace.current,
        );
}

extension _toChinese on DioExceptionType {
  String get chineseMessage {
    return switch (this) {
      DioExceptionType.connectionTimeout => '连接超时',
      DioExceptionType.sendTimeout => '客户端超时',
      DioExceptionType.receiveTimeout => '服务器响应超时',
      DioExceptionType.badCertificate => '未经授权',
      DioExceptionType.badResponse => '请求失败',
      DioExceptionType.cancel => '请求取消',
      DioExceptionType.connectionError => '请求错误',
      DioExceptionType.unknown => '未知错误',
    };
  }
}

class _ThrowableException {
  final int code;
  final String? message;

  const _ThrowableException(
    this.code,
    this.message,
  );

  String get debugMessage {
    return "Exception: code:$code message: $message,stack:${StackTrace.current}";
  }

  String toString() {
    return "$message - ($code)";
  }
}

_ThrowableException exceptionToThrowable(DioException ex) {
  if (ex is BizException) {
    return _ThrowableException(ex.code, _bizMessage[ex.code] ?? ex.message);
  }

  switch (ex.type) {
    case DioExceptionType.badResponse:
      final code = ex.response!.statusCode!;
      return _ThrowableException(code, _httpMessage[code]);

    default:
      return _ThrowableException(-1, ex.type.chineseMessage);
  }
}
