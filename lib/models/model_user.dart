part of 'index.dart';

@JsonDecodable()
class User {
  int id;
  String name;
  String email;
  String password;
  String token;
}
