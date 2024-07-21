import 'package:flutter/material.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';

class ProcessHeaderWidget extends StatelessWidget {
  const ProcessHeaderWidget({
    required this.title,
    required this.step,
    this.totalStep = 3,
    super.key,
  });

  final String title;
  final int step;
  final int totalStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  title,
                  style: context.textStyleTheme.bodyMediumSemiBold?.copyWith(
                    height: 1.5,
                  ),
                ),
              ),
            ),
            // TODO(Apurva): progress count code
            /*Container(
              decoration: BoxDecoration(
                color: context.themeColor.primaryColor2,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    100,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              child: Text(
                '$step / $totalStep',
                style: context.textStyleTheme.bodyMediumSemiBold?.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),*/
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        LinearProgressIndicator(
          minHeight: 6,
          value: step / totalStep,
          backgroundColor: context.themeColor.unFilledProgressColor,
          valueColor: AlwaysStoppedAnimation<Color>(
            context.themeColor.primaryColor ?? AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
      ],
    );
  }
}
