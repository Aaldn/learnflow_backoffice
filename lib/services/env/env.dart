import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env.dev")
abstract class Env {
  @Envied(obfuscate: true)
  @EnviedField(varName: 'SERVER_URL')
  static const serverUrl = _Env.serverUrl;
}
