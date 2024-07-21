import 'package:flutter/material.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/place_details/widgets/amenities_widget.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';

class PlaceInfoCard extends StatelessWidget {
  const PlaceInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(
          16,
        ),
        decoration: const BoxDecoration(
          color: Color(0xffF9FAFB),
          borderRadius: BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Sunshine residency',
                    style: context.textStyleTheme.headLine6,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: context.themeColor.ratingChipBgColor?.withOpacity(
                      0.15,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        50,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: context.themeColor.secondaryColor3,
                      ),
                      Text(
                        '4.8',
                        style: context.textStyleTheme.bodySmallMedium?.copyWith(
                          color: context.themeColor.secondaryColor3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.themeColor.primaryColor?.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        50,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(
                    3,
                  ),
                  child: Assets.vectors.locationFilled.svg(
                    height: 22,
                    width: 18,
                    colorFilter: ColorFilter.mode(
                      context.themeColor.primaryColor ?? AppColors.primaryColor,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    '789 Sunshine Blvd, Bright City, CA 90210',
                    style: context.textStyleTheme.bodyMediumRegular,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AmenitiesWidget(
                    amenityIcon: Assets.vectors.bed.path,
                    title: 'Bed size',
                    subTitle: 'Queen bed',
                  ),
                ),
                Expanded(
                  child: AmenitiesWidget(
                    amenityIcon: Assets.vectors.bed.path,
                    title: 'Furniture',
                    subTitle: 'Chair, Wardrobe',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: AmenitiesWidget(
                    amenityIcon: Assets.vectors.bed.path,
                    title: 'Air condition',
                    subTitle: 'Included',
                  ),
                ),
                Expanded(
                  child: AmenitiesWidget(
                    amenityIcon: Assets.vectors.bed.path,
                    title: 'Other amenities',
                    subTitle: 'Wifi',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
