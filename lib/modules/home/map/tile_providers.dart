import 'package:flutter_map/flutter_map.dart';

TileLayer get mapLayer => TileLayer(
      urlTemplate:
          'https://tiles.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}@2x.png?api_key=7751894d-650d-43aa-840b-f83b3750221e',
      // 'https://tiles.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}{r}.png?api_key=7751894d-650d-43aa-840b-f83b3750221e',
      // 'https://tiles.stadiamaps.com/styles/alidade_smooth.json?api_key=7751894d-650d-43aa-840b-f83b3750221e',
      // Use the recommended flutter_map_cancellable_tile_provider package to
      // support the cancellation of loading tiles.
    );
