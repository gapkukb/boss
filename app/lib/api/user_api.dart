part of './index.dart';

final queryUser = service.get('/user');
final updateUser = service.post(
  '/user',
  option(),
);
