part of 'global.dart';

class _Device {
  late final String deviceName;
  late final String deviceVersion;
  late final String identifier;

  Future<void> init() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        final info = await deviceInfoPlugin.androidInfo;

        deviceName = info.model;
        deviceVersion = info.version.toString();
        //UUID for Android
        identifier = info.id;
      } else if (Platform.isIOS) {
        final info = await deviceInfoPlugin.iosInfo;

        deviceName = info.name;
        deviceVersion = info.systemVersion;
        //UUID for iOS
        identifier = info.identifierForVendor ?? "unknown";
      } else if (kIsWeb) {
        final info = await deviceInfoPlugin.webBrowserInfo;
        deviceName = info.browserName.name;
        deviceVersion = info.appVersion!;
        //UUID for iOS
        identifier = info.userAgent!;
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }
}
