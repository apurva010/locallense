import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:provider/provider.dart';

import 'login_screen_store.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<LoginScreenStore>().loginWithGoogleOnPress();
                },
                child: Text(str.login),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
