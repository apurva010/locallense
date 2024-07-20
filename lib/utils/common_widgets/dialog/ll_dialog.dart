import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/utils/common_widgets/dialog/dialog_store.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:provider/provider.dart';
import 'package:screwdriver/screwdriver.dart';

import '../../../../values/app_colors.dart';

class LLDialog extends StatelessWidget {
  const LLDialog({
    this.primaryButton,
    super.key,
    this.title,
    this.msg,
    this.secondaryButton,
    this.horizontalPadding,
    this.header,
    this.contentWidget,
    this.columnCrossAxisAlignment,
  });

  final String? title;
  final String? msg;
  final LocalLensButton? primaryButton;
  final LocalLensButton? secondaryButton;
  final double? horizontalPadding;
  final Widget? header;
  final Widget? contentWidget;
  final CrossAxisAlignment? columnCrossAxisAlignment;

  Future<bool?> show({bool barrierDismissible = true}) => showDialog<bool>(
        context: navigation.context,
        builder: (_) => this,
        barrierDismissible: barrierDismissible,
      );

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => DialogStore(),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 34,
          vertical: 24,
        ),
        backgroundColor: Colors.black.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: ColoredBox(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (header.isNotNull) ...{
                      header!,
                      const SizedBox(
                        height: 16,
                      ),
                    },
                    if (title.isNotNullOrBlank) ...{
                      Text(
                        title!,
                        style: context.textStyleTheme.headLine6,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                    },
                    if (msg.isNotNullOrBlank) ...{
                      Text(
                        msg!,
                        textAlign: TextAlign.center,
                        style: context.textStyleTheme.bodyMediumRegular,
                      ),
                      const SizedBox(height: 16),
                    },
                    if (contentWidget.isNotNull) ...{
                      contentWidget!,
                      const SizedBox(height: 12),
                    },
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding ?? 12,
                      ),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: columnCrossAxisAlignment ??
                            CrossAxisAlignment.center,
                        children: [
                          if (secondaryButton != null) ...[
                            primaryButton!,
                          ],
                          if (secondaryButton != null) ...[
                            const SizedBox(height: 16),
                            secondaryButton!,
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
