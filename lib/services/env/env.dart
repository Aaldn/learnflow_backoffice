import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env.dev")
abstract class Env {
  @Envied(obfuscate: true)
  @EnviedField(varName: 'API_BASE_URL')
  static const apiBaseUrl = _Env.apiBaseUrl;
}
