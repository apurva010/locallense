import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/modules/home/map/map_screen_store.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';

class ChipScrollView extends StatelessWidget {
  const ChipScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.provide<MapScreenStore>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 36,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: store.labels.length,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemBuilder: (context, index) {
            final item = store.labels[index];
            return Observer(
              builder: (context) {
                return InkWell(
                  onTap: () => store.selectedChipIndex = index,
                  child: Container(
                    decoration: BoxDecoration(
                      color: store.selectedChipIndex == index
                          ? AppColors.primaryColor
                          : AppColors.chipColor,
                      border: Border.all(
                        color: AppColors.unFilledProgressColor,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      child: Text(
                        item,
                        style:
                            context.textStyleTheme.bodySmallRegular?.copyWith(
                          color: store.selectedChipIndex == index
                              ? AppColors.chipColor
                              : null,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 12,
            );
          },
        ),
      ),
    );
  }
}
