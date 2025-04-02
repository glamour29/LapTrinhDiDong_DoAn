import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadLottieJson extends StatelessWidget {
  const LoadLottieJson(
      {super.key, required this.asset, this.width, this.height, this.fit});

  final String asset;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/$asset.json',
      fit: fit,
      renderCache: RenderCache.raster,
      filterQuality: FilterQuality.high,
      width: width,
      height: height,
    );
  }
}
