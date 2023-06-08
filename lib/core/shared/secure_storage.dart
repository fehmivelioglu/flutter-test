import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  static SecureStorageManager? _instance;
  static SecureStorageManager get instance {
    _instance ??= SecureStorageManager._init();
    return _instance!;
  }

  SecureStorageManager._init();

  final _storage = const FlutterSecureStorage();

  AndroidOptions get _getAndroidOptions => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions get _getIosOptions =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  void setStorage(String key, String? value) {
    _storage.write(
        key: key,
        value: value,
        aOptions: _getAndroidOptions,
        iOptions: _getIosOptions);
  }

  Future<String?> getStorage(String key) {
    return _storage.read(
        key: key,
        aOptions: const AndroidOptions(encryptedSharedPreferences: true),
        iOptions: const IOSOptions(
            accessibility: KeychainAccessibility.first_unlock));
  }

  void deleteStorage() {
    _storage.deleteAll(aOptions: _getAndroidOptions, iOptions: _getIosOptions);
  }
}
