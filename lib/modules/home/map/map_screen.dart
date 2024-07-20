import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:locallense/modules/home/map/tile_providers.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: MapController(),
        options: const MapOptions(
          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.pinchMove |
                InteractiveFlag.drag |
                InteractiveFlag.pinchZoom,
          ),
          minZoom: 3,
          maxZoom: 19,
        ),
        children: [
          mapLayer,
        ],
      ),
    );
  }
}
