import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/utils/common_widgets/dialog/dialog_store.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';

import '../../../../values/enumeration.dart';

class SPAlertButton extends StatelessWidget {
  const SPAlertButton({
    required this.title,
    required this.onTap,
    required this.isPrimary,
    super.key,
    this.alertBtnType = ButtonType.primaryButton,
    this.width,
    this.padding,
    this.textOverFlow,
  });

  final String title;
  final Future<void> Function() onTap;
  final ButtonType alertBtnType;
  final double? width;
  final EdgeInsets? padding;
  final TextOverflow? textOverFlow;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final alertStore = context.maybeProvide<DialogStore>() ?? DialogStore();
    return Observer(
      builder: (context) {
        return LocalLensButton(
          onTap: () async {
            if (alertStore.isLoading) return;
            try {
              alertStore.isLoading = true;
              await onTap();
            } catch (e) {
              rethrow;
            } finally {
              alertStore.isLoading = false;
            }
          },
          buttonType: alertBtnType,
          width: width,
          btnText: title,
          isLoading: alertStore.isLoading,
        );
      },
    );
  }
}
