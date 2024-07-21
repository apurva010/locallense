import 'package:locallense/model/place_amenities_dm.dart';
import 'package:locallense/model/place_feature_dm.dart';
import 'package:mobx/mobx.dart';

part 'place_details_store.g.dart';

class PlaceDetailsStore = _PlaceDetailsStore with _$PlaceDetailsStore;

abstract class _PlaceDetailsStore with Store {
  List<PlaceFeatureDm> featureList = [
    PlaceFeatureDm(
      title: 'Kitchen',
      description: 'Fully equipped with microwave, fridge, and stove.',
    ),
  ];

  List<PlaceAmenitiesDm> amenitiesList = [
    PlaceAmenitiesDm(
      title: 'Bed size',
      description: 'Queen bed',
    ),
    PlaceAmenitiesDm(
      title: 'Bed size',
      description: 'Queen bed',
    ),
    PlaceAmenitiesDm(
      title: 'Bed size',
      description: 'Queen bed',
    ),
    PlaceAmenitiesDm(
      title: 'Bed size',
      description: 'Queen bed',
    ),
  ];
}
