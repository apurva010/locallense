import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/home/map/map_screen_store.dart';
import 'package:locallense/modules/home/map/widget/chip_scroll_view.dart';
import 'package:locallense/modules/home/map/widget/grabbing_widget.dart';
import 'package:locallense/modules/home/map/widget/place_card.dart';
import 'package:locallense/utils/common_widgets/sliding_up_panel.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/strings.dart';

class MapSlidingPanel extends StatelessWidget {
  const MapSlidingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.provide<MapScreenStore>();
    const radius = BorderRadius.vertical(
      top: Radius.circular(24),
    );
    return SlidingUpPanel(
      controller: store.panelController,
      borderRadius: radius,
      snapPoint: 0.5,
      backdropEnabled: true,
      color: AppColors.mapSlidingBGColor,
      minHeight: 87,
      maxHeight: MediaQuery.of(context).size.height * 0.8,
      // onPanelOpened: onPanelOpened,
      // onPanelClosed: onPanelClosed,
      // onPanelSlide: onPanelSlide,
      panel: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GrabbingWidget(),
            ),
          ),
          const SliverToBoxAdapter(
            child: ChipScrollView(),
          ),
          SliverFillRemaining(
            child: ListView.builder(
              controller: store.scrollController,
              itemCount: store.places.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final item = store.places[index];
                return InkWell(
                  splashColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  onTap: () => navigation.pushNamed(
                    AppRoutes.placeDetailScreen,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: PlaceCard(place: item),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
