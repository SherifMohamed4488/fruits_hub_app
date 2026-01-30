// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/apple_logo.svg
  SvgGenImage get appleLogo =>
      const SvgGenImage('assets/images/apple_logo.svg');

  /// File path: assets/images/background_onBoarding_item2.svg
  SvgGenImage get backgroundOnBoardingItem2 =>
      const SvgGenImage('assets/images/background_onBoarding_item2.svg');

  /// File path: assets/images/background_onBoarding_item_1.svg
  SvgGenImage get backgroundOnBoardingItem1 =>
      const SvgGenImage('assets/images/background_onBoarding_item_1.svg');

  /// File path: assets/images/bell_logo.svg
  SvgGenImage get bellLogo => const SvgGenImage('assets/images/bell_logo.svg');

  /// File path: assets/images/dark_green_with_curve_image.svg
  SvgGenImage get darkGreenWithCurveImage =>
      const SvgGenImage('assets/images/dark_green_with_curve_image.svg');

  /// File path: assets/images/dots_logo.svg
  SvgGenImage get dotsLogo => const SvgGenImage('assets/images/dots_logo.svg');

  /// File path: assets/images/facebook_logo.svg
  SvgGenImage get facebookLogo =>
      const SvgGenImage('assets/images/facebook_logo.svg');

  /// File path: assets/images/feature_fruit_background.svg
  SvgGenImage get featureFruitBackground =>
      const SvgGenImage('assets/images/feature_fruit_background.svg');

  /// File path: assets/images/filter_icon.svg
  SvgGenImage get filterIcon =>
      const SvgGenImage('assets/images/filter_icon.svg');

  /// File path: assets/images/freepik--Plant--inject-63.svg
  SvgGenImage get freepikPlantInject63 =>
      const SvgGenImage('assets/images/freepik--Plant--inject-63.svg');

  /// File path: assets/images/fruit_basket_logo.svg
  SvgGenImage get fruitBasketLogo =>
      const SvgGenImage('assets/images/fruit_basket_logo.svg');

  /// File path: assets/images/fruit_hub_logo.svg
  SvgGenImage get fruitHubLogo =>
      const SvgGenImage('assets/images/fruit_hub_logo.svg');

  /// File path: assets/images/google_logo.svg
  SvgGenImage get googleLogo =>
      const SvgGenImage('assets/images/google_logo.svg');

  /// File path: assets/images/green_with_curve_image.svg
  SvgGenImage get greenWithCurveImage =>
      const SvgGenImage('assets/images/green_with_curve_image.svg');

  /// File path: assets/images/offers_banner_background_image.png
  AssetGenImage get offersBannerBackgroundImage =>
      const AssetGenImage('assets/images/offers_banner_background_image.png');

  /// File path: assets/images/orange_offers_banner_background.png
  AssetGenImage get orangeOffersBannerBackground =>
      const AssetGenImage('assets/images/orange_offers_banner_background.png');

  /// File path: assets/images/orange_with_curve_image.svg
  SvgGenImage get orangeWithCurveImage =>
      const SvgGenImage('assets/images/orange_with_curve_image.svg');

  /// File path: assets/images/pineapple_logo.svg
  SvgGenImage get pineappleLogo =>
      const SvgGenImage('assets/images/pineapple_logo.svg');

  /// File path: assets/images/profile_photo.svg
  SvgGenImage get profilePhoto =>
      const SvgGenImage('assets/images/profile_photo.svg');

  /// File path: assets/images/search_icon.svg
  SvgGenImage get searchIcon =>
      const SvgGenImage('assets/images/search_icon.svg');

  /// File path: assets/images/text_item_1.svg
  SvgGenImage get textItem1 =>
      const SvgGenImage('assets/images/text_item_1.svg');

  /// File path: assets/images/text_item_2.svg
  SvgGenImage get textItem2 =>
      const SvgGenImage('assets/images/text_item_2.svg');

  /// File path: assets/images/valid_logo.svg
  SvgGenImage get validLogo =>
      const SvgGenImage('assets/images/valid_logo.svg');

  /// File path: assets/images/valid_logo_with_text_logo.svg
  SvgGenImage get validLogoWithTextLogo =>
      const SvgGenImage('assets/images/valid_logo_with_text_logo.svg');

  /// List of all assets
  List<dynamic> get values => [
    appleLogo,
    backgroundOnBoardingItem2,
    backgroundOnBoardingItem1,
    bellLogo,
    darkGreenWithCurveImage,
    dotsLogo,
    facebookLogo,
    featureFruitBackground,
    filterIcon,
    freepikPlantInject63,
    fruitBasketLogo,
    fruitHubLogo,
    googleLogo,
    greenWithCurveImage,
    offersBannerBackgroundImage,
    orangeOffersBannerBackground,
    orangeWithCurveImage,
    pineappleLogo,
    profilePhoto,
    searchIcon,
    textItem1,
    textItem2,
    validLogo,
    validLogoWithTextLogo,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
