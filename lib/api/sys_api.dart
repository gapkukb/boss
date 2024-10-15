part of './index.dart';

final uploadFile = service.post(
  '/upload',
  option(headers: {
    Headers.contentTypeHeader: Headers.multipartFormDataContentType,
  }),
);
