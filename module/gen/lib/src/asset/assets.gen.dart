/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_bishop_black.svg
  SvgGenImage get icBishopBlack =>
      const SvgGenImage('assets/icons/ic_bishop_black.svg');

  /// File path: assets/icons/ic_bishop_white.svg
  SvgGenImage get icBishopWhite =>
      const SvgGenImage('assets/icons/ic_bishop_white.svg');

  /// File path: assets/icons/ic_king_black.svg
  SvgGenImage get icKingBlack =>
      const SvgGenImage('assets/icons/ic_king_black.svg');

  /// File path: assets/icons/ic_king_white.svg
  SvgGenImage get icKingWhite =>
      const SvgGenImage('assets/icons/ic_king_white.svg');

  /// File path: assets/icons/ic_knight_black.svg
  SvgGenImage get icKnightBlack =>
      const SvgGenImage('assets/icons/ic_knight_black.svg');

  /// File path: assets/icons/ic_knight_white.svg
  SvgGenImage get icKnightWhite =>
      const SvgGenImage('assets/icons/ic_knight_white.svg');

  /// File path: assets/icons/ic_pawn_black.svg
  SvgGenImage get icPawnBlack =>
      const SvgGenImage('assets/icons/ic_pawn_black.svg');

  /// File path: assets/icons/ic_pawn_white.svg
  SvgGenImage get icPawnWhite =>
      const SvgGenImage('assets/icons/ic_pawn_white.svg');

  /// File path: assets/icons/ic_queen_black.svg
  SvgGenImage get icQueenBlack =>
      const SvgGenImage('assets/icons/ic_queen_black.svg');

  /// File path: assets/icons/ic_queen_white.svg
  SvgGenImage get icQueenWhite =>
      const SvgGenImage('assets/icons/ic_queen_white.svg');

  /// File path: assets/icons/ic_rook_black.svg
  SvgGenImage get icRookBlack =>
      const SvgGenImage('assets/icons/ic_rook_black.svg');

  /// File path: assets/icons/ic_rook_white.svg
  SvgGenImage get icRookWhite =>
      const SvgGenImage('assets/icons/ic_rook_white.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icBishopBlack,
        icBishopWhite,
        icKingBlack,
        icKingWhite,
        icKnightBlack,
        icKnightWhite,
        icPawnBlack,
        icPawnWhite,
        icQueenBlack,
        icQueenWhite,
        icRookBlack,
        icRookWhite
      ];
}

class Assets {
  Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
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
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
