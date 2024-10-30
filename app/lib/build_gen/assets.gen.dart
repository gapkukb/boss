/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsCaGen {
  const $AssetsCaGen();

  /// File path: assets/ca/lets-encrypt-r3.pem
  String get letsEncryptR3 => 'assets/ca/lets-encrypt-r3.pem';

  /// List of all assets
  List<String> get values => [letsEncryptR3];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/change_passwrod_ok.png
  AssetGenImage get changePasswrodOk => const AssetGenImage('assets/images/change_passwrod_ok.png');

  /// File path: assets/images/login_mood_board.png
  AssetGenImage get loginMoodBoard => const AssetGenImage('assets/images/login_mood_board.png');

  /// File path: assets/images/pay_ok.png
  AssetGenImage get payOk => const AssetGenImage('assets/images/pay_ok.png');

  /// File path: assets/images/sign_in_icon.png
  AssetGenImage get signInIcon => const AssetGenImage('assets/images/sign_in_icon.png');

  /// File path: assets/images/sign_up_icon.png
  AssetGenImage get signUpIcon => const AssetGenImage('assets/images/sign_up_icon.png');

  /// Directory path: assets/images/splash
  $AssetsImagesSplashGen get splash => const $AssetsImagesSplashGen();

  /// File path: assets/images/user_profile_backgroundimage.jpg
  AssetGenImage get userProfileBackgroundimage => const AssetGenImage('assets/images/user_profile_backgroundimage.jpg');

  /// File path: assets/images/withdraw.png
  AssetGenImage get withdraw => const AssetGenImage('assets/images/withdraw.png');

  /// List of all assets
  List<AssetGenImage> get values => [changePasswrodOk, loginMoodBoard, payOk, signInIcon, signUpIcon, userProfileBackgroundimage, withdraw];
}

class $AssetsImagesSplashGen {
  const $AssetsImagesSplashGen();

  /// File path: assets/images/splash/1.png
  AssetGenImage get a1 => const AssetGenImage('assets/images/splash/1.png');

  /// File path: assets/images/splash/2.png
  AssetGenImage get a2 => const AssetGenImage('assets/images/splash/2.png');

  /// File path: assets/images/splash/3.png
  AssetGenImage get a3 => const AssetGenImage('assets/images/splash/3.png');

  /// List of all assets
  List<AssetGenImage> get values => [a1, a2, a3];
}

class Assets {
  Assets._();

  static const $AssetsCaGen ca = $AssetsCaGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
