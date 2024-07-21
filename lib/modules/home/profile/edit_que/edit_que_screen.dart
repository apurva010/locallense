import 'package:flutter/material.dart';
import 'package:locallense/modules/profile/questionnaire/accommodation_type/select_accommodation_store.dart';
import 'package:locallense/modules/profile/questionnaire/accommodation_type/select_accommodation_type_screen.dart';
import 'package:locallense/modules/profile/questionnaire/flow_screens/questionnaire_flow_store.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:provider/provider.dart';

class EditQueScreen extends StatelessWidget {
  const EditQueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectAccommodationTypeScreen().withProviders(
      [
        Provider(
          create: (context) => SelectAccommodationStore(isEditScreen: true),
        ),
        Provider(
          create: (context) => QuestionnaireFlowStore(),
        ),
      ],
    );
  }
}
