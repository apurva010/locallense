import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/home/map/map_config/tile_providers.dart';
import 'package:locallense/modules/home/map/map_screen_store.dart';
import 'package:locallense/modules/home/map/widget/map_sliding_panel.dart';
import 'package:locallense/utils/common_validator/common_validator.dart';
import 'package:locallense/utils/common_widgets/ll_svg_picture.dart';
import 'package:locallense/utils/common_widgets/ll_text_form_field.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/constants.dart';
import 'package:screwdriver/screwdriver.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final store = context.provide<MapScreenStore>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        children: [
          Positioned.fill(
            child: FlutterMap(
              mapController: MapController(),
              options: MapOptions(
                onTap: (_, __) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                initialCenter: store.places[0].latLng,
                initialZoom: 12,
                cameraConstraint: CameraConstraint.contain(
                  bounds: LatLngBounds(
                    const LatLng(23.229875, 72.404805),
                    const LatLng(22.794896, 72.771987),
                  ),
                ),
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.pinchMove |
                      InteractiveFlag.drag |
                      InteractiveFlag.pinchZoom,
                ),
                minZoom: 3,
                maxZoom: 19,
              ),
              children: [
                mapLayer,
                MarkerLayer(
                  markers: store.places
                      .mapIndexed(
                        (i, e) => Marker(
                          point: e.latLng,
                          width: 25,
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              store.panelController.animatePanelToPosition(0.5);
                              store.scrollController.jumpTo((265 * i) + 16);
                            },
                            child: Center(
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: LLSvgPicture(
                                      Assets.vectors.pinBg.path,
                                      color: e.type.iconColor,
                                    ),
                                  ),
                                  Positioned(
                                    top: 4,
                                    left: 4,
                                    right: 4,
                                    bottom: 9,
                                    child: Container(
                                      width: 17,
                                      height: 17,
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: AppColors.whiteColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: LLSvgPicture(
                                          e.type.icon,
                                          color: e.type.iconColor,
                                          // width: 14,
                                          // height: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            left: 24,
            right: 24,
            child: LocalLensTextFormField(
              controller: store.searchController,
              borderRadius: 100,
              prefixIcon: LLSvgPicture(
                Assets.vectors.locationFilled.path,
                color: AppColors.textFieldLabelColor,
              ),
              suffixIcon: InkWell(
                onTap: store.searchController.clear,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: LLSvgPicture(
                    Assets.vectors.close.path,
                    color: AppColors.neutrals5,
                    size: 10,
                  ),
                ),
              ),
              hint: '360 Stillwater Rd...',
              maxLength: Constants.maxLengthOfEmail,
              validator: CommonValidator.emailValidator,
            ),
          ),
          const MapSlidingPanel(),
        ],
      ),
    );
  }
}
