import 'package:flutter/cupertino.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/place_details/place_details_store.dart';
import 'package:locallense/modules/place_details/widgets/amenities_widget.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';

class FeatureListWidget extends StatelessWidget {
  const FeatureListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.provide<PlaceDetailsStore>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Feature list',
          style: context.textStyleTheme.bodyXLargeSemiBold,
        ),
        const SizedBox(
          height: 16,
        ),
        ...List.generate(
          store.featureList.length,
          (index) {
            return AmenitiesWidget(
              amenityIcon: Assets.vectors.kitchen.path,
              iconHeight: 40,
              iconWidth: 40,
              title: store.featureList[index].title,
              titleTextStyle: context.textStyleTheme.bodyMediumSemiBold,
              subTitle: store.featureList[index].description,
              subTitleTextStyle: const TextStyle(
                fontSize: 13,
                color: AppColors.bodyTextRegular,
              ),
            );
          },
        ),
      ],
    );
  }
}
