import 'package:flutter/material.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';

enum ToastType { success, failure }

class LLToast extends StatelessWidget {
  const LLToast({
    required this.toastMessage,
    required this.toastType,
    super.key,
    this.showToastIcon = false,
    this.actionText,
    this.onActionTap,
  });

  final String toastMessage;
  final ToastType toastType;
  final bool showToastIcon;
  final String? actionText;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Card(
        elevation: 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0xffFCFCFD),
            border: Border(
              left: BorderSide(
                color: _getToastColor(),
                width: 4,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    toastMessage,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyleTheme.bodySmallRegular,
                  ),
                ),
                if (actionText != null) ...[
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    onTap: onActionTap,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        actionText!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _getToastColor(),
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getToastColor() {
    switch (toastType) {
      case ToastType.success:
        return AppColors.primaryColor;
      case ToastType.failure:
        return const Color(0xffF87171);
    }
  }
}
