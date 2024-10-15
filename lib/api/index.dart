library api;

import 'package:dio/dio.dart';
import '../service/service.dart';

part 'user_api.dart';
part 'sys_api.dart';
part 'test_api.dart';

final service = Service(baseOption());
final thirdService = Service(baseOption(
  baseUrl: 'https://api.kuleu.com/api',
));
