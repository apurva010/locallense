import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locallense/app_global_variables.dart';

typedef OnWillPop = Future<bool> Function();

class LLPopScope extends StatelessWidget {
  const LLPopScope({
    required this.child,
    this.onWillPop,
    super.key,
  });

  final Widget child;
  final OnWillPop? onWillPop;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        /// If it is already popped do nothing.
        if (didPop) return;

        /// If it is not popped check the [onWillPop] callback. And pop the
        /// widget if it returns true.
        final shouldPop = await onWillPop?.call();
        if (context.mounted && (shouldPop ?? false)) {
          if (navigation.canPop) {
            navigation.pop();
          } else {
            await SystemNavigator.pop(animated: true);
          }
        }
      },
      child: child,
    );
  }
}
