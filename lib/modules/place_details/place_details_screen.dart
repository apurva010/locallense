import 'package:flutter/material.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/place_details/widgets/feature_list_widget.dart';
import 'package:locallense/modules/place_details/widgets/map_location_for_place.dart';
import 'package:locallense/modules/place_details/widgets/place_image_widget.dart';
import 'package:locallense/modules/place_details/widgets/place_info_card.dart';
import 'package:locallense/modules/profile/complete_your_profile/select_preferences/preference_chips.dart';
import 'package:locallense/modules/profile/complete_your_profile/select_preferences/select_preference_store.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PlaceImageWidget(),
              const PlaceInfoCard(),
              Container(
                margin: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About sunshine residency',
                      style: context.textStyleTheme.headLine6,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Sunshine Residency offers comfortable living with modern amenities in a prime location, ideal for students and professionals.',
                      style: context.textStyleTheme.bodyMediumRegular?.copyWith(
                        color: AppColors.neutrals3,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const FeatureListWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Preferences match',
                      style: context.textStyleTheme.headLine6,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const PreferenceChips().withProvider(
                      SelectPreferenceStore([]),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const MapLocationForPlace(),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Contact details',
                      style: context.textStyleTheme.headLine6,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.textFieldColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                            child: Assets.images.profile.image(
                              width: 80,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Charles J. Decker',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style:
                                    context.textStyleTheme.headLine6?.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'charles@gmail.com',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: context.textStyleTheme.bodyXSmallMedium
                                    ?.copyWith(
                                  height: 1.5,
                                  fontSize: 13,
                                  color: AppColors.heroTextColor,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '9898096762',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: context.textStyleTheme.bodyXSmallMedium
                                    ?.copyWith(
                                  height: 1.5,
                                  fontSize: 13,
                                  color: AppColors.heroTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
