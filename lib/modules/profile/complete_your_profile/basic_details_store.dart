import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:locallense/utils/network/network_state_store.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:mobx/mobx.dart';

part 'basic_details_store.g.dart';

class BasicDetailsStore = _BasicDetailsStore with _$BasicDetailsStore;

abstract class _BasicDetailsStore extends NetworkStateStore with Store {
  @observable
  NetworkState networkState = NetworkState.idle;
  final formKey = GlobalKey<FormState>();

  final TextEditingController datePickerController = TextEditingController();

  @observable
  File? profilePicture;

  @observable
  NetworkState profileState = NetworkState.idle;

  Future<void> onTapFunction({required BuildContext context}) async {
    final pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    datePickerController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
  }

  Future<void> nextPage() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        networkState = NetworkState.loading;
      }
    } catch (e, s) {
      networkState = NetworkState.error;
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  Future<void> pickProfilePic() async {
    try {
      final img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      profileState = NetworkState.loading;

      if (img == null) return;
      profilePicture = File(img.path);
      profileState = NetworkState.success;
    } catch (e, s) {
      profileState = NetworkState.error;
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }
}
