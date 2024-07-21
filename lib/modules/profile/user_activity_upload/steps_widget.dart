import 'package:flutter/material.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({
    this.step = '',
    this.stepWidget,
    super.key,
  });

  final String step;
  final Widget? stepWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 2,
              width: 2,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor2,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    40,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            if (stepWidget != null) ...{
              stepWidget!
            } else ...{
              Expanded(
                child: Text(
                  step,
                  style: context.textStyleTheme.bodyMediumRegular
                      ?.copyWith(height: 1.5),
                ),
              ),
            }
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
