import 'package:dio/dio.dart';
import 'interceptors/logger.dart';
import 'interceptors/response_resolver.dart';
import 'interceptors/errors_handler.dart';
part 'option.dart';

typedef _Method = _Configure Function(String uri, [Options? option]);
typedef _Configure = Future<T> Function<T>(
    [Object? payload, T model, Options? option]);

class Service {
  late final Dio _dio;

  Service([BaseOptions? option]) {
    _dio = Dio(option ?? _baseOption);
    _dio.interceptors
      ..add(Logger())
      ..add(ResponseResolver())
      ..add(ErrorsHandler());
  }

  _Method _request(String method) {
    return (String uri, [Options? option]) {
      return <T extends dynamic>([Object? payload, T? model, Options? option]) {
        return _dio.request(uri, data: payload, options: option).then((value) {
          return model?.fromJson(value) ?? value;
        });
      };
    };
  }

  late final post = _request('post');
  late final get = _request('get');
}
