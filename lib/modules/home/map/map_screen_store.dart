import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:locallense/modules/home/map/model/place_dm.dart';
import 'package:locallense/utils/common_widgets/sliding_up_panel.dart';
import 'package:locallense/utils/permission_helper.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:mobx/mobx.dart';

part 'map_screen_store.g.dart';

class MapScreenStore = _MapScreenStore with _$MapScreenStore;

abstract class _MapScreenStore with Store {
  _MapScreenStore() {
    // identifyCurrentLocation();
  }

  MapController mapController = MapController();

  /// Sliding Panel params..............................................
  PanelController panelController = PanelController();

  ScrollController scrollController = ScrollController();

  List<String> labels = [
    'All',
    ...PrefType.values.map((e) => e.title),
  ];

  @observable
  int selectedChipIndex = 0;

  TextEditingController searchController = TextEditingController();

  List<PlaceDm> places = [
    PlaceDm(
      id: '1',
      name: 'Coffee corner',
      address: 'P, Mondeal Square, Sarkhej - Gandhinagar Hwy',
      openHours: '8:30am – 11:30pm',
      ratting: 4.5,
      imgUrl:
          'https://lh3.googleusercontent.com/proxy/w7k0UUPZdPzPOJKZJt9iV1Ey1yVf0eiOpyY1Kvdl-LUFtyrSbqc7Z55U8gDTWKul1n15xXKqt0K8M5mLRRXChUKOWYZwhUU0p6x_42qFv5Ot7c6cwFdI6oNLbr6YDKDfpRuaCyGboYmy43_2wGt3kV7_jJ9qXKyOiw',
      latitude: 23.025600,
      longitude: 72.519802,
      type: PrefType.cafe,
    ),
    PlaceDm(
      id: '2',
      name: 'Coffee By Di Bella Arista',
      address: 'GF/4, Arista Business Hub, Sindhu Bhavan Marg',
      openHours: '10:30am – 12:30pm',
      ratting: 4.3,
      imgUrl:
          'https://lh3.googleusercontent.com/p/AF1QipPcWWa4KbGpVSYIQWF81baObxA97NJJ3VP0VMBZ=s1360-w1360-h1020',
      latitude: 23.040495,
      longitude: 72.507692,
      type: PrefType.museum,
    ),
    PlaceDm(
      id: '3',
      name: 'Cafe De Italiano',
      address: 'Arista Hub, 3, Sindhu Bhavan Marg',
      openHours: '9:00am – 12:30pm',
      ratting: 4,
      imgUrl:
          'https://lh3.googleusercontent.com/p/AF1QipPtT5g93XrqTnzBHVjx3szWQbFKpqXwxvGjROeO=s1360-w1360-h1020',
      latitude: 23.008908,
      longitude: 72.486431,
      type: PrefType.hospital,
    ),
    PlaceDm(
      id: '4',
      name: 'The Dark Roast',
      address: 'Ground Floor Wide Angle Multiplex, Sarkhej - Gandhinagar Hwy,',
      openHours: '11:00am – 1:00pm',
      ratting: 3.9,
      imgUrl:
          'https://lh3.googleusercontent.com/p/AF1QipPGz2dggPNBzPmNfx0_WkGFVsQ6iKMtb1STRQLV=s1360-w1360-h1020',
      latitude: 23.012537,
      longitude: 72.503382,
      type: PrefType.shoppingCenter,
    ),
  ];

  @observable
  Position? currentLocation;

  Future<void> identifyCurrentLocation() async {
    await PermissionHelper.checkLocationPermission();
    currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    if (currentLocation != null) {
      mapController.move(
        LatLng(currentLocation!.latitude, currentLocation!.longitude),
        14,
      );
    }
  }
}
