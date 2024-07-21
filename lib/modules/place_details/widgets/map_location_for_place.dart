import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/home/map/map_config/tile_providers.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';

class MapLocationForPlace extends StatelessWidget {
  const MapLocationForPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Map location',
          style: context.textStyleTheme.headLine6,
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 260,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            child: FlutterMap(
              mapController: MapController(),
              options: const MapOptions(
                initialCenter: LatLng(
                  23.035765,
                  72.529463,
                ),
                interactionOptions: InteractionOptions(
                  flags: InteractiveFlag.none,
                ),
                minZoom: 3,
                maxZoom: 19,
              ),
              children: [
                mapLayer,
                MarkerLayer(
                  markers: [
                    Marker(
                      height: 164,
                      width: 164,
                      point: const LatLng(
                        23.035765,
                        72.529463,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 164,
                            width: 164,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(
                                0.1,
                              ),
                              border: Border.all(
                                color: AppColors.primaryColor,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  80,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 34,
                            left: 56,
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    40,
                                  ),
                                ),
                              ),
                              child: Assets.images.pin.image(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Distance from your location',
          style: context.textStyleTheme.bodySmallMedium,
        ),
        Text(
          '16 Km',
          style: context.textStyleTheme.bodyXLargeSemiBold,
        ),
      ],
    );
  }
}
