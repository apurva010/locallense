import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locallense/gen/assets.gen.dart';

class LLSvgPicture extends StatelessWidget {
  const LLSvgPicture(
    this.assetName, {
    super.key,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
    this.isSvgNetwork = false,
  });

  final String assetName;
  final Color? color;

  final double? size;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final bool isSvgNetwork;

  @override
  Widget build(BuildContext context) {
    return isSvgNetwork
        ? SvgPicture.network(
            assetName,
            width: size ?? width,
            height: size ?? height,
            fit: fit,
            alignment: alignment,
            colorFilter: color != null
                ? ColorFilter.mode(
                    color!,
                    BlendMode.srcIn,
                  )
                : null,
            placeholderBuilder: (context) => Assets.vectors.placeholderIcon.svg(
              height: size ?? height,
              width: size ?? width,
              colorFilter: color != null
                  ? ColorFilter.mode(
                      color!,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
          )
        : SvgPicture.asset(
            assetName,
            width: size ?? width,
            height: size ?? height,
            fit: fit,
            alignment: alignment,
            colorFilter: color != null
                ? ColorFilter.mode(
                    color!,
                    BlendMode.srcIn,
                  )
                : null,
          );
  }
}
