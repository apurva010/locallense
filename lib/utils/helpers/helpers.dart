import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locallense/utils/common_widgets/ll_toast.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:logging/logging.dart';

/// allows to set system icon theme (light | dark)
void setSystemIcons({required bool dark}) {
  SystemChrome.setSystemUIOverlayStyle(
    (dark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light).copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {});
}

void setAppOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

String enumToString(Object o) => o.toString().split('.').last;

T enumFromString<T>(String key, List<T> values) =>
    values.firstWhere((v) => key == enumToString(v!));

void showErrorToast(
  String msg, {
  int duration = 3,
  bool showToastIcon = false,
  String? actionText,
  VoidCallback? onActionTap,
}) {
  BotToast.showCustomNotification(
    toastBuilder: (cancel) {
      return LLToast(
        toastMessage: msg,
        toastType: ToastType.failure,
        showToastIcon: showToastIcon,
        onActionTap: onActionTap,
        actionText: actionText,
      );
    },
    duration: Duration(seconds: duration),
  );
}

void showSuccessToast(
  String msg, {
  int duration = 3,
  bool showToastIcon = false,
  String? actionText,
  VoidCallback? onActionTap,
}) {
  BotToast.showCustomNotification(
    toastBuilder: (cancel) {
      return LLToast(
        toastMessage: msg,
        toastType: ToastType.success,
        showToastIcon: showToastIcon,
        onActionTap: onActionTap,
        actionText: actionText,
      );
    },
    duration: Duration(seconds: duration),
  );
}

LocationPreferences? parseLocationPref(String location) {
  switch (location) {
    case 'Hospitals':
      return LocationPreferences.hospital;
    case 'Cafe/Restaurant':
      return LocationPreferences.cafeRestaurant;
    case 'Tourist Attraction':
      return LocationPreferences.touristAttraction;
  }
  return null;
}
