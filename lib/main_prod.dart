import 'package:flutter/material.dart';

import 'app_config.dart';
import 'flavors/flavor.dart';
import 'flavors/flavor_config.dart';
import 'flavors/flavor_values.dart';
import 'services/shared_prefs.dart';
import 'utils/helpers/helpers.dart';
import 'values/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.initialise();
  setAppOrientation();
  setupLogging();
  runApp(const FlavoredApp());
}

class FlavoredApp extends StatelessWidget {
  const FlavoredApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlavorConfig(
      flavor: Flavor.prod,
      values: FlavorValues(
        baseUrl: Constants.baseUrl,
      ),
      child: const AppConfig(),
    );
  }
}
