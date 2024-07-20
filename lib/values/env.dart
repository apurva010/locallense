import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'OPEN_AI_SECRET', obfuscate: false)
  static String gptKey = _Env.openAISecret;
}
