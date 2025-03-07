import 'package:flutter/material.dart';
import 'package:locallense/model/question_flow_navigation_dm.dart';
import 'package:locallense/model/response/preferences/preferences_res.dart';
import 'package:locallense/modules/edit_profile/edit_profile_screen.dart';
import 'package:locallense/modules/home/home_screen.dart';
import 'package:locallense/modules/home/home_screen_store.dart';
import 'package:locallense/modules/home/profile/edit_pref/edit_pref_screen.dart';
import 'package:locallense/modules/home/profile/edit_que/edit_que_screen.dart';
import 'package:locallense/modules/loginScreen/login_screen.dart';
import 'package:locallense/modules/loginScreen/login_screen_store.dart';
import 'package:locallense/modules/place_details/place_details_screen.dart';
import 'package:locallense/modules/place_details/place_details_store.dart';
import 'package:locallense/modules/profile/complete_your_profile/basic_details_screen.dart';
import 'package:locallense/modules/profile/complete_your_profile/basic_details_store.dart';
import 'package:locallense/modules/profile/complete_your_profile/select_preferences/select_preference_store.dart';
import 'package:locallense/modules/profile/complete_your_profile/select_preferences/select_your_preference.dart';
import 'package:locallense/modules/profile/questionnaire/accommodation_type/select_accommodation_store.dart';
import 'package:locallense/modules/profile/questionnaire/accommodation_type/select_accommodation_type_screen.dart';
import 'package:locallense/modules/profile/questionnaire/flow_screens/questionnaire_flow_screen.dart';
import 'package:locallense/modules/profile/questionnaire/flow_screens/questionnaire_flow_store.dart';
import 'package:locallense/modules/profile/user_activity_upload/user_activity_upload_screen.dart';
import 'package:locallense/modules/profile/user_activity_upload/user_activity_upload_store.dart';
import 'package:locallense/modules/splashScreen/intro_screen.dart';
import 'package:locallense/modules/splashScreen/splash_screen_store.dart';
import 'package:provider/provider.dart';

import '../../values/strings.dart';
import '../common_widgets/invalid_route.dart';
import '../extensions.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings, Widget root) {
    Route<dynamic> getRoute({
      required Widget widget,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<void>(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    switch (settings.name) {
      case AppRoutes.forwardSlash:
        return getRoute(widget: root);
      case AppRoutes.homeScreen:
        return getRoute(
          widget: const HomeScreen().withProvider(HomeScreenStore()),
        );
      case AppRoutes.basicDetailsScreen:
        return getRoute(
          widget: const BasicDetailsScreen()
              .withProvider(BasicDetailsStore()..getUserData()),
        );

      case AppRoutes.loginScreen:
        return getRoute(
          widget: const LoginScreen().withProvider(LoginScreenStore()),
        );
      case AppRoutes.introScreen:
        return getRoute(
          widget: const IntroScreen().withProvider(SplashScreenStore()),
        );
      case AppRoutes.selectPreference:
        final perferences = settings.arguments! as List<PreferencesRes>;
        return getRoute(
          widget: const SelectYourPreference().withProvider(
            SelectPreferenceStore(preSelectPreferences: perferences),
          ),
        );

      case AppRoutes.userActivityUpload:
        return getRoute(
          widget: const UserActivityUploadScreen().withProvider(
            UserActivityUploadStore(),
          ),
        );

      case AppRoutes.placeDetailScreen:
        return getRoute(
          widget: const PlaceDetailsScreen().withProvider(PlaceDetailsStore()),
        );

      case AppRoutes.selectAccommodationType:
        return getRoute(
          widget: const SelectAccommodationTypeScreen().withProviders(
            [
              Provider(
                create: (context) => SelectAccommodationStore(),
              ),
              Provider(
                create: (context) => QuestionnaireFlowStore(),
              ),
            ],
          ),
        );

      case AppRoutes.questionnaireFlowScreen:
        return getRoute(
          widget: const QuestionnaireFlowScreen().withProvider(
            QuestionnaireFlowStore(
              questionFlowNavigationDm:
                  settings.arguments as QuestionFlowNavigationDm?,
            ),
          ),
        );

      case AppRoutes.editPrefScreen:
        return getRoute(
          widget: const EditPrefScreen().withProvider(
            SelectPreferenceStore(
              preSelectPreferences: [],
              fetchSelectedData: true,
            ),
          ),
        );
      case AppRoutes.editQueScreen:
        return getRoute(widget: const EditQueScreen());

      case AppRoutes.editProfileScreen:
        return getRoute(
          widget: const EditProfileScreen().withProvider(
            BasicDetailsStore()..getUserData(),
          ),
        );

      /// An invalid route. User shouldn't see this, it's for debugging purpose
      /// only.
      default:
        return getRoute(widget: const InvalidRoute());
    }
  }
}
