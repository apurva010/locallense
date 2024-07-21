import 'package:flutter/material.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/home/map/model/place_dm.dart';
import 'package:locallense/utils/common_widgets/ll_svg_picture.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/constants.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    required this.place,
    super.key,
  });

  final PlaceDm place;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.chipColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE6E8EC),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 150,
            child: place.imgUrl.isNotNullAndNotEmpty
                ? Image.network(
                    place.imgUrl!,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                : ColoredBox(
                    color: AppColors.unFilledProgressColor,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: LLSvgPicture(
                        Assets.vectors.placeholderIcon.path,
                        color: AppColors.neutrals3,
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    /// DATA - Location Name
                    Expanded(
                      child: Text(
                        place.name ?? Constants.empty,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyleTheme.bodyXLargeSemiBold,
                      ),
                    ),

                    /// DATA - Ratting
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.rattingColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          LLSvgPicture(
                            Assets.vectors.star.path,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            place.ratting.toString(),
                            style:
                                context.textStyleTheme.bodyTextBold?.copyWith(
                              color: AppColors.rattingColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),

                /// DATA - Open hours
                if (place.reason.isNotNullAndNotEmpty) ...[
                  Text(
                    place.reason.toString(),
                    style: context.textStyleTheme.bodySmallRegular,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],

                /// DATA - Address
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: LLSvgPicture(
                        Assets.vectors.locationFilled.path,
                        color: AppColors.primaryColor,
                        size: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Text(
                        place.address ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyleTheme.bodySmallRegular,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                /// DATA - Open hours
                if (place.openHours.isNotNullAndNotEmpty)
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: LLSvgPicture(
                          Assets.vectors.clock.path,
                          color: AppColors.primaryColor,
                          size: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Text(
                          place.openHours!,
                          style: context.textStyleTheme.bodySmallRegular,
                        ),
                      ),
                    ],
                  ),
                if ((place.types?.length ?? 2) > 1)
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: LLSvgPicture(
                          Assets.vectors.myPrefsIcon.path,
                          color: AppColors.primaryColor,
                          size: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Text(
                          place.types
                                  ?.map((e) => e.replaceAll("_", " "))
                                  .join(', ') ??
                              '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyleTheme.bodySmallRegular,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
