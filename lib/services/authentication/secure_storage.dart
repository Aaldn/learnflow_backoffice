import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final secureStorageProvider = Provider<SecureStorageNotifier>((ref) {
  return SecureStorageNotifier(ref, const FlutterSecureStorage());
});

class SecureStorageNotifier extends StateNotifier<String?> {
  SecureStorageNotifier(this.ref, this.secureStorage) : super(null);

  Ref ref;
  FlutterSecureStorage secureStorage;

  Future<String?> getApiToken() async {
    return await secureStorage.read(key: "api_token");
  }

  Future<void> setApiToken(String token) async {
    await secureStorage.write(key: "api_token", value: token);
  }

  Future<void> deleteApiToken(String token) async {
    await secureStorage.delete(key: "api_token");
  }
}
