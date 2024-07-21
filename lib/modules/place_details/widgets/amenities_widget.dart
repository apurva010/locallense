import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locallense/utils/extensions.dart';

class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({
    required this.amenityIcon,
    required this.title,
    required this.subTitle,
    this.titleTextStyle,
    this.subTitleTextStyle,
    this.iconHeight,
    this.iconWidth,
    super.key,
  });

  final String amenityIcon;
  final String title;
  final String subTitle;

  final double? iconHeight;
  final double? iconWidth;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          amenityIcon,
          height: iconHeight,
          width: iconWidth,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style:
                    titleTextStyle ?? context.textStyleTheme.bodyXSmallMedium,
              ),
              Text(
                subTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: subTitleTextStyle ??
                    context.textStyleTheme.bodySmallMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
