import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:locallense/apibase/repository/api_repository.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/model/request/update_user/update_user_info_req.dart';
import 'package:locallense/model/response/user/user_data_res.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/network/network_state_store.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:locallense/values/strings.dart';
import 'package:mobx/mobx.dart';

part 'basic_details_store.g.dart';

class BasicDetailsStore = _BasicDetailsStore with _$BasicDetailsStore;

abstract class _BasicDetailsStore extends NetworkStateStore with Store {
  @observable
  NetworkState networkState = NetworkState.idle;

  @observable
  NetworkState buttonLoading = NetworkState.idle;
  final formKey = GlobalKey<FormState>();

  final TextEditingController datePickerController = TextEditingController();

  @observable
  String? profilePicture;

  UserDataRes? userDataRes;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @observable
  String emailAddress = '';

  Future<void> getUserData() async {
    networkState = NetworkState.loading;
    try {
      final data = await APIRepository.instance.getUserData().getResult();
      userDataRes = data;
      firstNameController.text = data.firstName;
      lastNameController.text = data.lastName;
      emailAddress = data.email;
      profilePicture = data.profileUrl;
      networkState = NetworkState.success;
    } catch (e) {
      // TODO(Sahil): Show Error snackBar
      networkState = NetworkState.error;
    }
  }

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
        if (userDataRes?.firstName != firstNameController.text ||
            lastNameController.text != lastNameController.text) {
          await APIRepository.instance
              .updateUserData(
                UpdateUserInfoReq(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                ),
              )
              .getResult();
        }
        buttonLoading = NetworkState.loading;
        unawaited(
          navigation.pushNamed(AppRoutes.userActivityUpload),
        );
        buttonLoading = NetworkState.success;
      }
    } catch (e, s) {
      buttonLoading = NetworkState.error;
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }
}
