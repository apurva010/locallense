import 'dart:ui';

import 'package:locallense/gen/assets.gen.dart';

enum NetworkState {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == NetworkState.idle;

  bool get isLoading => this == NetworkState.loading;

  bool get isSuccessful => this == NetworkState.success;

  bool get isFailed => this == NetworkState.error;
}

enum SharedPrefsKeys { isLoggedIn, userData }

enum SecureStorageKeys { kAccessToken }

enum ButtonType {
  primaryButton,
  secondaryButton,
  textOnly;

  bool get isPrimaryBtn => this == ButtonType.primaryButton;
}

enum SnackBarType {
  success,
  error;
}

enum PrefType {
  restaurant,
  cafe,
  shoppingCenter,
  museum,
  hospital,
  pg;

  String get title => switch (this) {
        hospital => 'Hospital',
        restaurant => 'Restaurant',
        cafe => 'Cafes',
        shoppingCenter => 'Shopping Center',
        museum => 'Museum',
        pg => 'PGs',
      };

  String get icon => switch (this) {
        hospital => Assets.vectors.hospital.path,
        restaurant => Assets.vectors.restaurant.path,
        cafe => Assets.vectors.cafe.path,
        shoppingCenter => Assets.vectors.shoppingCenter.path,
        museum => Assets.vectors.museum.path,
        pg => Assets.vectors.pg.path,
      };

  Color get iconColor => switch (this) {
        hospital => const Color(0xff48BC65),
        restaurant => const Color(0xff1A3064),
        cafe => const Color(0xff9757D7),
        shoppingCenter => const Color(0xff588157),
        museum => const Color(0xffF77F00),
        pg => const Color(0xff2FA2B9),
      };
}

enum LocationPreferences {
  hospital('Hospitals'),
  cafeRestaurant('Cafe/Restaurant'),
  touristAttraction('Tourist attraction');

  const LocationPreferences(
    this.title,
  );

  final String title;

  bool get isHospital => this == LocationPreferences.hospital;

  bool get isCafeRestaurant => this == LocationPreferences.cafeRestaurant;

  bool get isTouristAttraction => this == LocationPreferences.touristAttraction;
}

enum Cuisine {
  indian('Indian'),
  italian('Italian'),
  chinese('Chinese'),
  maxican('Maxican'),
  thai('Thai');

  const Cuisine(
    this.title,
  );

  final String title;
}

enum DoctorSpecialization {
  cardiology('Cardiology'),
  dermatology('Dermatology'),
  neurology('Neurology'),
  gastroenterology('Gastroenterology');

  const DoctorSpecialization(
    this.title,
  );

  final String title;
}
