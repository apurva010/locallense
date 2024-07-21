import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:screwdriver/screwdriver.dart';

class LLEmptyListPlaceHolder extends StatelessWidget {
  const LLEmptyListPlaceHolder({
    this.svgPlaceholder,
    this.imagePlaceholder,
    super.key,
    this.state,
    this.emptyTitle,
    this.emptySubtitle,
    this.errorTitle,
    this.errorSubtitle,
    this.loadingTitle,
    this.loadingSubtitle,
    this.onButtonClick,
    this.buttonText,
    this.enableBackground = false,
    this.imageRatio,
    this.expanded = false,
    this.padding,
    this.withSpinKit = false,
    this.btnWidth,
    this.isNetworkImage,
    this.titleStyle,
    this.subtitleStyle,
    this.buttonIcon,
    this.buttonType = ButtonType.primaryButton,
    this.imagePadding,
    this.getNote,
  });

  final bool expanded;
  final double? imageRatio;
  final NetworkState? state;
  final VoidCallback? onButtonClick;
  final String? loadingTitle;
  final String? loadingSubtitle;
  final String? errorTitle;
  final String? errorSubtitle;
  final String? emptyTitle;
  final String? emptySubtitle;
  final String? buttonText;
  final bool enableBackground;
  final String? svgPlaceholder;
  final String? imagePlaceholder;
  final EdgeInsets? padding;
  final bool withSpinKit;
  final double? btnWidth;
  final bool? isNetworkImage;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget? buttonIcon;
  final ButtonType buttonType;
  final EdgeInsets? imagePadding;
  final Widget? getNote;

  bool get isImageOrSVGAvailable =>
      svgPlaceholder.isNotNullOrEmpty || imagePlaceholder.isNotNullOrEmpty;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var title = '';
    var subtitle = '';
    switch (state ?? NetworkState.idle) {
      case NetworkState.idle:
        break;
      case NetworkState.loading:
        title = loadingTitle ?? '';
        subtitle = loadingSubtitle ?? '';
      case NetworkState.success:
        title = emptyTitle ?? '';
        subtitle = emptySubtitle ?? '';
      case NetworkState.error:
        title = errorTitle ?? '';
        subtitle = errorSubtitle ?? '';
    }
    return Container(
      width: expanded ? double.maxFinite : null,
      height: expanded ? double.maxFinite : null,
      padding: padding ?? const EdgeInsets.all(24),
      child: Center(
        child: state?.isLoading ?? false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (withSpinKit) ...[
                    const SpinKitThreeBounce(
                      color: AppColors.primaryColor,
                      size: 40,
                    ),
                  ] else ...[
                    SpinKitRing(
                      color: theme.primaryColor,
                      lineWidth: 5,
                    ),
                  ],
                  if (title.isNotEmpty) ...{
                    const SizedBox(height: 30),
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      style: theme.textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  },
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isImageOrSVGAvailable && !(isNetworkImage ?? false)) ...{
                    Padding(
                      padding: imagePadding ?? EdgeInsets.zero,
                      child: AspectRatio(
                        aspectRatio: imageRatio ?? 1,
                        child: imagePlaceholder != null
                            ? Image.asset(imagePlaceholder!)
                            : SvgPicture.asset(svgPlaceholder!),
                      ),
                    ),
                  } else if (isNetworkImage ?? false) ...{
                    Padding(
                      padding: imagePadding ?? EdgeInsets.zero,
                      child: AspectRatio(
                        aspectRatio: imageRatio ?? 1,
                        child: CachedNetworkImage(
                          imageUrl: imagePlaceholder ?? '',
                        ),
                      ),
                    ),
                  },
                  if (title.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: titleStyle ?? theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      style: subtitleStyle ?? theme.textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  if ((buttonText?.isNotEmpty ?? false) &&
                      onButtonClick != null) ...{
                    const SizedBox(height: 10),
                    LocalLensButton(
                      btnText: buttonText,
                      icon: buttonIcon,
                      onTap: onButtonClick!,
                      width: btnWidth,
                      buttonType: buttonType,
                    ),
                  },
                  if (getNote != null) ...[
                    SizedBox(height: 16),
                    getNote!,
                  ],
                ],
              ),
      ),
    );
  }
}
