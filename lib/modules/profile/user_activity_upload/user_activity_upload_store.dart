import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:html/parser.dart' show parse;
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:locallense/apibase/repository/api_repository.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/model/response/preferences/preferences_res.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/helpers/helpers.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:locallense/values/env.dart';
import 'package:locallense/values/strings.dart';
import 'package:mobx/mobx.dart';
import 'package:screwdriver/screwdriver.dart';

part 'user_activity_upload_store.g.dart';

class UserActivityUploadStore = _UserActivityUploadStore
    with _$UserActivityUploadStore;

abstract class _UserActivityUploadStore with Store {
  _UserActivityUploadStore() {
    loadPreferences();
  }

  @observable
  NetworkState screenState = NetworkState.idle;

  @observable
  NetworkState fileState = NetworkState.error;

  @observable
  NetworkState apiState = NetworkState.idle;

  FilePickerResult? userActivityFile;

  String? userFileContent;

  List<PreferencesRes> preferences = [];

  Future<void> loadPreferences() async {
    try {
      screenState = NetworkState.loading;
      final response =
          await APIRepository.instance.getPreferences().getResult();
      preferences = response;
      screenState = NetworkState.success;
    } catch (e) {
      screenState = NetworkState.error;
      showErrorToast(e.toString());
    }
  }

  Future<void> continueToNextScreen() async {
    if (userFileContent != null) {
      final response = await generateText(
        userFileContent!,
        Env.gptKey,
      );
      final finalPreference = <PreferencesRes>[];
      for (final choice in response) {
        final validChoice = preferences.firstWhereOrNull(
          (element) => element.preference.capitalized == choice.capitalized,
        );
        if (validChoice != null) {
          finalPreference.add(validChoice);
        }
      }
      if (apiState.isSuccessful) {
        unawaited(
          navigation.pushReplacementNamed(
            AppRoutes.selectPreference,
            arguments: finalPreference,
          ),
        );
      }
    }
  }

  Future<List<String>> generateText(String userActivity, String key) async {
    try {
      apiState = NetworkState.loading;
      final data = extractLinksFromHtml(userActivity);
      var usersearch = data.join(',');
      usersearch = usersearch.substring(0, min(usersearch.length, 13000));

      const apiUrl = 'https://api.openai.com/v1/chat/completions';
      final url = Uri.parse(apiUrl);
      final requestData = <String, dynamic>{
        'model': 'gpt-3.5-turbo-0125',
        'messages': [
          {
            'role': 'user',
            'content': '''
            Identify my lifestyle from given my map activity data and let aleast 3 even if it is somewhat relatable
             preference like as given: ${preferences.implode(
              joinWith: ',',
              withValue: (e) => e.preference,
            )}.
             Your output should be in this json format only : { "preference" : [ "Healthcare", "Restaurant"]}.
             Do not add any other text just json format. my Map activity: $usersearch
             ''',
          }
        ],
        'temperature': 0.7,
      };

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $key',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final data =
            // ignore: avoid_dynamic_calls
            (json.decode(
          // ignore: avoid_dynamic_calls
          json
              .decode(response.body)['choices'][0]['message']['content']
              .toString(),
        ) as Map)
                .cast<String, dynamic>();
        // ignore: avoid_dynamic_calls
        apiState = NetworkState.success;
        return (data['preference'] as List).cast<String>();
        //return (data['preference'] as List).cast<String>();
      } else {
        throw Exception(
          'Failed to generate text: ${response.body}:: ${response.statusCode}',
        );
      }
    } catch (e) {
      apiState = NetworkState.error;
      showErrorToast(e.toString());
      return [];
    }
  }

  void skipToNextScreen() {
    navigation.pushReplacementNamed(
      AppRoutes.selectPreference,
      arguments: <String>[],
    );
  }

  Future<void> uploadUserActivity() async {
    userActivityFile = await FilePicker.platform.pickFiles(
      dialogTitle: 'Please pick you activity file',
      withData: true,
      type: FileType.custom,
      allowedExtensions: ['html'],
    );
    if (userActivityFile?.isSinglePick ?? false) {
      final file = File(userActivityFile!.files.single.path!);
      userFileContent = await file.readAsString();
      fileState = NetworkState.success;
    }
  }

  List<String> splitStringIntoChunks(String input, int maxChunkSize) {
    final chunks = <String>[];
    for (var i = 0; i < input.length; i += maxChunkSize) {
      if (chunks.length < 14000) {
        chunks.add(
          input.substring(
            i,
            i + maxChunkSize < input.length ? i + maxChunkSize : input.length,
          ),
        );
      } else {
        break;
      }
    }
    return chunks;
  }

  String concatenateChunks(List<String> chunks) {
    return chunks.join();
  }

  List<String> extractLinksFromHtml(String htmlContent) {
    final links = <String>[];

    // Parse the HTML content
    final document = parse(htmlContent);

    // Find all <a> elements
    final elements = document.querySelectorAll('a');

    // Extract text from each <a> element
    for (final element in elements) {
      if (element.text != 'here') {
        links.add(element.text);
      }
    }

    return links;
  }
}
