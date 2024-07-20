import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:screwdriver/screwdriver.dart';

import '../../values/app_colors.dart';

class LocalLensTextFormField extends StatelessWidget {
  const LocalLensTextFormField({
    this.label,
    super.key,
    this.controller,
    this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.isEmailValidationRequired = false,
    this.maxLines,
    this.borderRadius,
    this.enabled = true,
    this.autocorrect = true,
    this.onChange,
    this.initialText,
    this.textInputAction,
    this.onSubmit,
    this.suffixIcon,
    this.errorMsg,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.minLines,
    this.prefixIcon,
    this.style,
    this.labelStyle,
    this.textCapitalization = TextCapitalization.none,
    this.enableInteractiveSelection = true,
    this.contentPadding,
    this.suffixIconConstraint,
    this.textFieldConstraint,
    this.isCollapse = true,
    this.focusNode,
    this.onTap,
    this.readOnly = false,
  });

  final String? errorMsg;
  final TextEditingController? controller;
  final String? hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isEmailValidationRequired;
  final ValueChanged<String>? onSubmit;
  final int? maxLines;
  final double? borderRadius;
  final bool enabled;
  final bool autocorrect;
  final Widget? suffixIcon;
  final String? label;
  final Function(String?)? onChange;
  final String? Function(String?)? validator;
  final String? initialText;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? minLines;
  final Widget? prefixIcon;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextCapitalization textCapitalization;
  final bool enableInteractiveSelection;
  final EdgeInsets? contentPadding;
  final BoxConstraints? suffixIconConstraint;
  final BoxConstraints? textFieldConstraint;
  final bool isCollapse;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius ?? 20);
    final outLineBorder = OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(
        color: Colors.black.withOpacity(
          0.1,
        ),
      ),
    );
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotNullOrBlank) ...[
          Text(
            label!,
            style: labelStyle ??
                context.textStyleTheme.bodyMediumRegular?.copyWith(
                  color: context.themeColor.primaryColor2,
                ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          focusNode: focusNode,
          scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          textAlignVertical: TextAlignVertical.center,
          enabled: enabled,
          initialValue: initialText,
          key: key,
          minLines: minLines,
          onChanged: onChange,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          obscureText: obscureText,
          controller: controller,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          autocorrect: autocorrect,
          onFieldSubmitted: onSubmit,
          validator: validator,
          textCapitalization: textCapitalization,
          enableInteractiveSelection: enableInteractiveSelection,
          style:
              style /* ??
              (enabled
                  ? textTheme.bodyMedium?.copyWith(
                      height: 20 / (textTheme.bodyMedium?.fontSize ?? 14),
                    )
                  : textTheme.bodyMedium?.copyWith(
                      color: AppColors.disabledTextFieldFontColor,
                      height: 20 / (textTheme.bodyMedium?.fontSize ?? 14),
                    ))*/
          ,
          // cursorColor: AppColors.primaryFontColors,
          cursorHeight: 20,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 16, right: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        prefixIcon!,
                      ],
                    ),
                  )
                : null,
            suffixIcon: suffixIcon,
            constraints: textFieldConstraint,
            suffixIconConstraints: suffixIconConstraint,
            isCollapsed: isCollapse,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            filled: true,
            alignLabelWithHint: true,
            enabled: enabled,
            fillColor: AppColors.textFieldColor,
            errorMaxLines: 1,
            hintText: hint,
            border: outLineBorder,
            enabledBorder: outLineBorder,
            counter: const SizedBox.shrink(),
            focusedBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: BorderSide(
                color: errorMsg.isNotNullOrBlank
                    ? AppColors.primaryColor
                    : AppColors.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
