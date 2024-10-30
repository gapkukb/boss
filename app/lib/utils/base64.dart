import 'dart:convert';

class Base64Utils {
  Base64Utils._();

  /// Encodes a string to Base64
  static String encode(String data) {
    final bytes = utf8.encode(data);
    return base64Encode(bytes);
  }

  /// Decodes a Base64 string
  static String decode(String base64Data) {
    final bytes = base64Decode(base64Data);
    return utf8.decode(bytes);
  }
}
