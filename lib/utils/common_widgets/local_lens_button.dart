import 'package:flutter/material.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:screwdriver/screwdriver.dart';

import '../../values/app_colors.dart';
import '../../values/enumeration.dart';

class LocalLensButton extends StatelessWidget {
  const LocalLensButton({
    required this.onTap,
    this.btnText,
    this.subtitle,
    super.key,
    this.showBorder = false,
    this.buttonColor,
    this.textColor,
    this.textStyle,
    this.borderWidth,
    this.borderRadius,
    this.fontSize,
    this.enabled = true,
    this.buttonInnerPadding,
    this.borderColor,
    this.isLoading = false,
    this.loaderColor,
    this.minimumButtonWidth = false,
    this.width,
    this.height,
    this.buttonType = ButtonType.primaryButton,
    this.child,
    this.globalKey,
    this.fittedText = false,
    this.icon,
    this.fontColor,
  }) : assert(
            !(width != null && minimumButtonWidth),
            'Please set either width or '
            "minimumButtonWidth, You can't set both property at same time.");

  final void Function() onTap;
  final String? btnText;
  final String? subtitle;
  final bool showBorder;
  final Color? buttonColor;
  final Color? textColor;
  final double? borderWidth;
  final double? borderRadius;
  final double? fontSize;
  final bool enabled;
  final EdgeInsets? buttonInnerPadding;
  final TextStyle? textStyle;
  final Color? borderColor;
  final bool isLoading;
  final Color? loaderColor;
  final double? width;
  final double? height;
  final bool minimumButtonWidth;
  final ButtonType buttonType;
  final Widget? child;
  final GlobalKey? globalKey;
  final bool fittedText;
  final Widget? icon;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: SizedBox(
        width: minimumButtonWidth ? null : (width ?? double.infinity),
        height: height ?? 52,
        child: ElevatedButton(
          key: globalKey,
          onPressed: enabled ? onTap : null,
          style: ElevatedButton.styleFrom(
            padding: buttonInnerPadding ??
                const EdgeInsets.symmetric(horizontal: 20),
            elevation: 0,
            backgroundColor: _getBackgroundColor(buttonType),
            disabledBackgroundColor: _getDisabledColor(buttonType),
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 20),
              side: BorderSide(
                width: borderWidth ?? 1.0,
                color: _getBorderColor(),
              ),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: loaderColor ?? AppColors.whiteColor,
                    strokeWidth: 2.5,
                  ),
                )
              : child ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: minimumButtonWidth
                        ? MainAxisSize.min
                        : MainAxisSize.max,
                    children: [
                      if (icon.isNotNull) icon!,
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Text(
                                btnText ?? '',
                                style: textStyle?.copyWith(height: 0) ??
                                    _getButtonTextStyle(buttonType, context),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (subtitle.isNotNullOrBlank) ...{
                              FittedBox(
                                child: Text(
                                  subtitle!,
                                  style: textStyle,
                                ),
                              ),
                            },
                          ],
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(ButtonType type) {
    switch (type) {
      case ButtonType.primaryButton:
        return buttonColor ?? AppColors.neutrals1;
      case ButtonType.secondaryButton:
        return AppColors.whiteColor;
      case ButtonType.textOnly:
        return Colors.transparent;
    }
  }

  Color _getDisabledColor(ButtonType type) {
    switch (type) {
      case ButtonType.primaryButton:
        return buttonColor ?? Colors.grey;
      case ButtonType.secondaryButton:
        return AppColors.whiteColor;
      case ButtonType.textOnly:
        return Colors.transparent;
    }
  }

  TextStyle? _getButtonTextStyle(ButtonType type, BuildContext context) {
    switch (type) {
      case ButtonType.primaryButton:
        return context.textStyleTheme.primaryButtonText;
      case ButtonType.secondaryButton:
      case ButtonType.textOnly:
        return context.textStyleTheme.primaryButtonText?.copyWith(
          color: fontColor ?? AppColors.primaryColor2,
          height: 0,
        );
    }
  }

  Color _getBorderColor() {
    if (showBorder) {
      return borderColor ?? AppColors.primaryColor2;
    } else {
      switch (buttonType) {
        case ButtonType.primaryButton:
          return Colors.transparent;
        case ButtonType.secondaryButton:
          return AppColors.primaryColor2;
        case ButtonType.textOnly:
          return Colors.transparent;
      }
    }
  }
}
