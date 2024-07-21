import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/gen/assets.gen.dart';

class PlaceImageWidget extends StatelessWidget {
  const PlaceImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.images.home.image(
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 10,
          left: 20,
          child: InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            onTap: navigation.pop,
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
