part of 'service.dart';

final _baseOption = BaseOptions(
  baseUrl: "https://jsonplaceholder.typicode.com",
  contentType: Headers.jsonContentType,
  connectTimeout: Duration(seconds: 5),
  sendTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 5),
  responseType: ResponseType.json,
  headers: {
    'Authorization': Headers.jsonContentType,
    'Platform': Headers.jsonContentType,
    Headers.acceptHeader: Headers.jsonContentType,
  },
);

Options option({
  Duration? sendTimeout,
  Duration? receiveTimeout,
  Map<String, Object?> extra = const {},
  Map<String, Object?>? headers,
  bool? preserveHeaderCase,
  ResponseType? responseType,
  String? contentType,
  bool? receiveDataWhenStatusError,
  bool? persistentConnection,
  ListFormat? listFormat,
  bool? loading,
  bool? silent,
  bool? background,
}) {
  return Options(
    sendTimeout: sendTimeout,
    receiveTimeout: receiveTimeout,
    extra: extra
      ..addAll({
        '_loading': loading,
        '_silent': silent,
        '_background': background,
      }),
    headers: headers,
    preserveHeaderCase: preserveHeaderCase,
    responseType: responseType,
    contentType: contentType,
    receiveDataWhenStatusError: receiveDataWhenStatusError,
    persistentConnection: persistentConnection,
    listFormat: listFormat,
  );
}

final baseOption = _baseOption.copyWith;

extension Extra on Map<String, Object?> {
  /** 同时设置loading,silent */
  bool get background => this['_background'] as bool? ?? false;
  /** 是否显示loading */
  bool get loading => this['_loading'] as bool? ?? background;
  /** 是否显示错误信息 */
  bool get silent => this['_silent'] as bool? ?? background;
}
