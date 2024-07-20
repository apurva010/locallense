import 'package:locallense/apibase/repository/api_repository.dart';
import 'package:locallense/apibase/repository/auth_repository.dart';
import 'package:locallense/app_session.dart';
import 'package:locallense/flavors/flavor_values.dart';
import 'package:locallense/generated/l10n.dart';
import 'package:locallense/modules/home/utils/home_utils.dart';
import 'package:locallense/utils/navigation/ll_navigation.dart';
import 'package:locallense/utils/network_utils.dart';

final str = Str.current;
final networkService = NetworkService.instance;
final apiRepository = APIRepository.instance;
final flavorValues = FlavorValues.instance;
final homeKeyManager = HomeNavigatorKeyManager.instance;
final appSession = AppSession.instance;
final navigation = LLNavigation.instance;
final authRepository = AuthRepository.instance;
