// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Str {
  Str();

  static Str? _current;

  static Str get current {
    assert(_current != null,
        'No instance of Str was loaded. Try to initialize the Str delegate before accessing Str.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Str> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Str();
      Str._current = instance;

      return instance;
    });
  }

  static Str of(BuildContext context) {
    final instance = Str.maybeOf(context);
    assert(instance != null,
        'No instance of Str present in the widget tree. Did you add Str.delegate in localizationsDelegates?');
    return instance!;
  }

  static Str? maybeOf(BuildContext context) {
    return Localizations.of<Str>(context, Str);
  }

  /// `No data found`
  String get noDataFound {
    return Intl.message(
      'No data found',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Action you requested was cancelled.`
  String get requestCancelledExceptionMsg {
    return Intl.message(
      'Action you requested was cancelled.',
      name: 'requestCancelledExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `We couldn’t connect. Please check your internet connection and try again`
  String get connectionTimeoutExceptionMsg {
    return Intl.message(
      'We couldn’t connect. Please check your internet connection and try again',
      name: 'connectionTimeoutExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `It took too long to send your request. Please try again.`
  String get sendTimeoutExceptionMsg {
    return Intl.message(
      'It took too long to send your request. Please try again.',
      name: 'sendTimeoutExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `We didn’t receive a response. Please try again.`
  String get receiveTimeoutExceptionMsg {
    return Intl.message(
      'We didn’t receive a response. Please try again.',
      name: 'receiveTimeoutExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnectionExceptionMsg {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnectionExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong with the data format`
  String get formatExceptionMsg {
    return Intl.message(
      'Something went wrong with the data format',
      name: 'formatExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong with the data parsing`
  String get modelParsingExceptionMsg {
    return Intl.message(
      'Something went wrong with the data parsing',
      name: 'modelParsingExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error occurred`
  String get unexpectedErrorExceptionMsg {
    return Intl.message(
      'Unexpected error occurred',
      name: 'unexpectedErrorExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `There was a problem with your request. Please check and try again.`
  String get badRequestExceptionMsg {
    return Intl.message(
      'There was a problem with your request. Please check and try again.',
      name: 'badRequestExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `You are not authorized to access this resource. please sign in.`
  String get unauthorisedRequestExceptionMsg {
    return Intl.message(
      'You are not authorized to access this resource. please sign in.',
      name: 'unauthorisedRequestExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `You are not allowed to access this resource.`
  String get forbiddenExceptionMsg {
    return Intl.message(
      'You are not allowed to access this resource.',
      name: 'forbiddenExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `The request could not be completed due to a conflict.`
  String get conflictExceptionMsg {
    return Intl.message(
      'The request could not be completed due to a conflict.',
      name: 'conflictExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `The page you requested could not be found.`
  String get notFoundExceptionMsg {
    return Intl.message(
      'The page you requested could not be found.',
      name: 'notFoundExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `Request took too long to reach the server. Please try again later.`
  String get requestTimeoutExceptionMsg {
    return Intl.message(
      'Request took too long to reach the server. Please try again later.',
      name: 'requestTimeoutExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `Your session expired due to password change. Please login again`
  String get sessionExpiredExceptionMsg {
    return Intl.message(
      'Your session expired due to password change. Please login again',
      name: 'sessionExpiredExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been deleted. If this was unintended, please contact the admin.`
  String get userDeletedExceptionMsg {
    return Intl.message(
      'Your account has been deleted. If this was unintended, please contact the admin.',
      name: 'userDeletedExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `We are experiencing technical difficulties. Please try again later.`
  String get internalServerErrorExceptionMsg {
    return Intl.message(
      'We are experiencing technical difficulties. Please try again later.',
      name: 'internalServerErrorExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `We are experiencing temporary problems. Please try again later.`
  String get badGatewayExceptionMsg {
    return Intl.message(
      'We are experiencing temporary problems. Please try again later.',
      name: 'badGatewayExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `The service is unavailable. Please try again later.`
  String get serviceUnavailableExceptionMsg {
    return Intl.message(
      'The service is unavailable. Please try again later.',
      name: 'serviceUnavailableExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `The request took too long to complete. Please try again later`
  String get gatewayTimeoutExceptionMsg {
    return Intl.message(
      'The request took too long to complete. Please try again later',
      name: 'gatewayTimeoutExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Session expired. Please sign in again.`
  String get errorUserIsSignedOut {
    return Intl.message(
      'Session expired. Please sign in again.',
      name: 'errorUserIsSignedOut',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Find places that fit your lifestyle and preferences perfectly.`
  String get loginSubtitleText {
    return Intl.message(
      'Find places that fit your lifestyle and preferences perfectly.',
      name: 'loginSubtitleText',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `By logging in or registering, you agree to our`
  String get byLoggingInOrRegisteringYouAgreeToOur {
    return Intl.message(
      'By logging in or registering, you agree to our',
      name: 'byLoggingInOrRegisteringYouAgreeToOur',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `and acknowledge our`
  String get andAcknowledgeOur {
    return Intl.message(
      'and acknowledge our',
      name: 'andAcknowledgeOur',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy.`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy.',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to your account`
  String get signInToYourAccount {
    return Intl.message(
      'Sign in to your account',
      name: 'signInToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get discover {
    return Intl.message(
      'Discover',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Upload your my activity file that will help us to know better about your preferences`
  String get uploadActivityFileTxt {
    return Intl.message(
      'Upload your my activity file that will help us to know better about your preferences',
      name: 'uploadActivityFileTxt',
      desc: '',
      args: [],
    );
  }

  /// `Upload your activity`
  String get uploadActivityText {
    return Intl.message(
      'Upload your activity',
      name: 'uploadActivityText',
      desc: '',
      args: [],
    );
  }

  /// `Complete your profile`
  String get completeProfileTitle {
    return Intl.message(
      'Complete your profile',
      name: 'completeProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueTxt {
    return Intl.message(
      'Continue',
      name: 'continueTxt',
      desc: '',
      args: [],
    );
  }

  /// `Skip for now`
  String get skipForNow {
    return Intl.message(
      'Skip for now',
      name: 'skipForNow',
      desc: '',
      args: [],
    );
  }

  /// `Select your preferences`
  String get selectYourPreferences {
    return Intl.message(
      'Select your preferences',
      name: 'selectYourPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: '',
      args: [],
    );
  }

  /// `Complete your profile`
  String get completeYourProfile {
    return Intl.message(
      'Complete your profile',
      name: 'completeYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get complete {
    return Intl.message(
      'Complete',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `PG reference form`
  String get pgReferenceForm {
    return Intl.message(
      'PG reference form',
      name: 'pgReferenceForm',
      desc: '',
      args: [],
    );
  }

  /// `Select the type of accommodation you prefer`
  String get selectAccommodationTxt {
    return Intl.message(
      'Select the type of accommodation you prefer',
      name: 'selectAccommodationTxt',
      desc: '',
      args: [],
    );
  }

  /// `Please select amenities and facilities that are important to you`
  String get selectAmenitiesAndFacilitiesTxt {
    return Intl.message(
      'Please select amenities and facilities that are important to you',
      name: 'selectAmenitiesAndFacilitiesTxt',
      desc: '',
      args: [],
    );
  }

  /// `What are your other nearby location preferences`
  String get otherNearByLocationPreference {
    return Intl.message(
      'What are your other nearby location preferences',
      name: 'otherNearByLocationPreference',
      desc: '',
      args: [],
    );
  }

  /// `Hospitals`
  String get hospitals {
    return Intl.message(
      'Hospitals',
      name: 'hospitals',
      desc: '',
      args: [],
    );
  }

  /// `Cafe/Restaurant`
  String get caferestaurant {
    return Intl.message(
      'Cafe/Restaurant',
      name: 'caferestaurant',
      desc: '',
      args: [],
    );
  }

  /// `Tourist attraction`
  String get touristAttraction {
    return Intl.message(
      'Tourist attraction',
      name: 'touristAttraction',
      desc: '',
      args: [],
    );
  }

  /// `Single room`
  String get singleRoom {
    return Intl.message(
      'Single room',
      name: 'singleRoom',
      desc: '',
      args: [],
    );
  }

  /// `Shared room`
  String get sharedRoom {
    return Intl.message(
      'Shared room',
      name: 'sharedRoom',
      desc: '',
      args: [],
    );
  }

  /// `Both will work`
  String get bothWillWork {
    return Intl.message(
      'Both will work',
      name: 'bothWillWork',
      desc: '',
      args: [],
    );
  }

  /// `Wifi`
  String get wifi {
    return Intl.message(
      'Wifi',
      name: 'wifi',
      desc: '',
      args: [],
    );
  }

  /// `Air conditioning`
  String get airConditioning {
    return Intl.message(
      'Air conditioning',
      name: 'airConditioning',
      desc: '',
      args: [],
    );
  }

  /// `Kitchen access`
  String get kitchenAccess {
    return Intl.message(
      'Kitchen access',
      name: 'kitchenAccess',
      desc: '',
      args: [],
    );
  }

  /// `Laundry service`
  String get laundryService {
    return Intl.message(
      'Laundry service',
      name: 'laundryService',
      desc: '',
      args: [],
    );
  }

  /// `Parking space`
  String get parkingSpace {
    return Intl.message(
      'Parking space',
      name: 'parkingSpace',
      desc: '',
      args: [],
    );
  }

  /// `Gym fitness`
  String get gymFitness {
    return Intl.message(
      'Gym fitness',
      name: 'gymFitness',
      desc: '',
      args: [],
    );
  }

  /// `Study/Work desk`
  String get studyworkDesk {
    return Intl.message(
      'Study/Work desk',
      name: 'studyworkDesk',
      desc: '',
      args: [],
    );
  }

  /// `How important is it for you to live near a hospital or medical center?`
  String get hospitalFirstQuestion {
    return Intl.message(
      'How important is it for you to live near a hospital or medical center?',
      name: 'hospitalFirstQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any specific medical requirements or conditions that require nearby medical attention?`
  String get hospitalSecondQuestion {
    return Intl.message(
      'Do you have any specific medical requirements or conditions that require nearby medical attention?',
      name: 'hospitalSecondQuestion',
      desc: '',
      args: [],
    );
  }

  /// `If you need medical consultation or assistance, what level of consultant would you prefer?`
  String get hospitalThirdQuestion {
    return Intl.message(
      'If you need medical consultation or assistance, what level of consultant would you prefer?',
      name: 'hospitalThirdQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Hospital questionnaire`
  String get hospitalQuestionnaire {
    return Intl.message(
      'Hospital questionnaire',
      name: 'hospitalQuestionnaire',
      desc: '',
      args: [],
    );
  }

  /// `Very important`
  String get veryImportant {
    return Intl.message(
      'Very important',
      name: 'veryImportant',
      desc: '',
      args: [],
    );
  }

  /// `Somewhat important`
  String get somewhatImportant {
    return Intl.message(
      'Somewhat important',
      name: 'somewhatImportant',
      desc: '',
      args: [],
    );
  }

  /// `Not important`
  String get notImportant {
    return Intl.message(
      'Not important',
      name: 'notImportant',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Senior consultant`
  String get seniorConsultant {
    return Intl.message(
      'Senior consultant',
      name: 'seniorConsultant',
      desc: '',
      args: [],
    );
  }

  /// `Specialist`
  String get specialist {
    return Intl.message(
      'Specialist',
      name: 'specialist',
      desc: '',
      args: [],
    );
  }

  /// `General practitioner`
  String get generalPractitioner {
    return Intl.message(
      'General practitioner',
      name: 'generalPractitioner',
      desc: '',
      args: [],
    );
  }

  /// `No preferences`
  String get noPreferences {
    return Intl.message(
      'No preferences',
      name: 'noPreferences',
      desc: '',
      args: [],
    );
  }

  /// `What type of dining options are you interested in having nearby?`
  String get cafeRestaurantFirstQue {
    return Intl.message(
      'What type of dining options are you interested in having nearby?',
      name: 'cafeRestaurantFirstQue',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Str> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Str> load(Locale locale) => Str.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
