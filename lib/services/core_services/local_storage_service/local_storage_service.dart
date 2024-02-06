import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/app/_app.dart';
import '../../../models/_models.dart';
import 'i_local_storage_service.dart';

class LocalStorageService extends ILocalStorageService {
  final _log = getLogger('LocalStorageService');
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  @override
  Future<String?> secureRead(String key) async {
    try {
      final res = await _storage.read(key: key);
      _log.i('READ KEY: $key WITH RESULT: $res');
      return res;
    } on Exception catch (e) {
      _log.e(e);
      throw DeviceFailure(data: e);
    }
  }

  @override
  Future<void> secureWrite(String key, String data) async {
    try {
      _log.i('WRITING KEY: $key WITH DATA: $data');
      await _storage.write(key: key, value: data);
    } on Exception catch (e) {
      _log.e(e);
      throw DeviceFailure(data: e);
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
      _log.i('Cleared Storage');
    } on Exception catch (e) {
      _log.e(e);
      throw DeviceFailure(message: 'Something went wrong', data: e.toString());
    }
  }
}
