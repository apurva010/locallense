import 'package:flutter/material.dart';

import 'app.dart';
import 'utils/extensions.dart';
import 'values/app_theme_store.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.hideKeyboard,
      child: const LocalLensApp().withProvider(AppThemeStore()),
    );
  }
}
