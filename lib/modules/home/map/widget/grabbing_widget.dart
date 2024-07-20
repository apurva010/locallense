import 'package:flutter/material.dart';
import 'package:locallense/values/app_colors.dart';

class GrabbingWidget extends StatelessWidget {
  const GrabbingWidget({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: AppColors.grabbingColor,
        ),
        height: height ?? 5,
        width: width ?? 50,
      ),
    );
  }
}
