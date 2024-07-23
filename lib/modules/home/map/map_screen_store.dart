import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/home/map/model/place_dm.dart';
import 'package:locallense/utils/common_widgets/sliding_up_panel.dart';
import 'package:locallense/utils/permission_helper.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:mobx/mobx.dart';
import 'package:screwdriver/screwdriver.dart';

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

  @observable
  NetworkState networkState = NetworkState.idle;

  TextEditingController searchController = TextEditingController();

  Future<void> prefPlacesAPICall({
    String? profilePhoto,
    String apiEndPoint = 'api/myFragilePak/Account/updateProfile',
  }) async {
    try {
      networkState = NetworkState.loading;
      final formData = FormData.fromMap({
        'user_prefrences': {
          'user_preferences': {
            'What type of dining options are you interested in having nearby?':
                'Restaurants',
            'Do you have specific cuisine preferences for nearby dining options?':
                'Yes',
            'Are you looking for PGs located in areas with a vibrant social scene or nightlife?':
                'yes',
            'Are you interested in PGs near venues that host special events or themed nights at cafes/restaurants?':
                'No',
          }.toString(),
        }.toString(),
        'location': 'thaltej',
        'prefrence': 'Restaurant',
      });
      final response = await Dio().post(
        'https://221b-14-99-102-226.ngrok-free.app/local_lensAI',
        data: formData,
      );
      var data = response.data;
      final finalData = <PlaceDm>[];

      if (data != null) {
        final jsonRes = data as List;
        for (final element in jsonRes) {
          finalData.add(
            PlaceDm.fromJson((element as Map).cast<String, dynamic>()),
          );
        }
      }

      if (finalData.isNotNullOrEmpty) {
        appSession.places
          ..clear()
          ..addAll(finalData);
      } else {
        appSession.places
          ..clear()
          ..addAll(places);
      }
      networkState = NetworkState.success;
    } catch (error, s) {
      networkState = NetworkState.error;
      appSession.places
        ..clear()
        ..addAll(places);
      debugPrint(error.toString());
      debugPrintStack(stackTrace: s);
    }
  }

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
      types: [PrefType.cafe.name],
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
      types: [PrefType.museum.name],
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
      types: [PrefType.hospital.name],
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
      types: [PrefType.shoppingCenter.name],
    ),
  ];

  @observable
  Position? currentLocation;

  Future<void> identifyCurrentLocation() async {
    await PermissionHelper.checkLocationPermission();
    currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
