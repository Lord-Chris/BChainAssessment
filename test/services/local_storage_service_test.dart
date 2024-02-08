import 'package:bchain_assessment/models/_models.dart';
import 'package:bchain_assessment/services/_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  group('LocalStorageService Test -', () {
    group('secure Read', () {
      test('secureRead should return the value of the key', () async {
        // Arrange
        final storage = MockFlutterSecureStorage();
        final service = LocalStorageService(storage: storage);
        const key = 'keyParam';
        const value = 'valueParam';

        when(() => storage.read(key: key)).thenAnswer((_) async => value);

        // Act
        final res = await service.secureRead(key);

        // Assert
        expect(res, value);
      });

      test('secureRead should throw DeviceFailure when an exception occurs',
          () async {
        // Arrange
        final storage = MockFlutterSecureStorage();
        final service = LocalStorageService(storage: storage);
        const key = 'keyParam';

        when(() => storage.read(key: key)).thenThrow(Exception());

        // Act
        final call = service.secureRead(key);

        // Assert
        expect(call, throwsA(isA<DeviceFailure>()));
      });
    });

    group('secure Write', () {
      test('secureWrite should write the key and value', () async {
        // Arrange
        final storage = MockFlutterSecureStorage();
        final service = LocalStorageService(storage: storage);
        const key = 'keyParam';
        const value = 'valueParam';

        when(() => storage.write(key: key, value: value))
            .thenAnswer((_) async {});

        // Act
        await service.secureWrite(key, value);

        // Assert
        verify(() => storage.write(key: key, value: value)).called(1);
      });

      test('secureWrite should throw DeviceFailure when an exception occurs',
          () async {
        // Arrange
        final storage = MockFlutterSecureStorage();
        final service = LocalStorageService(storage: storage);
        const key = 'keyParam';
        const value = 'valueParam';

        when(() => storage.write(key: key, value: value))
            .thenThrow(Exception());

        // Act
        final call = service.secureWrite(key, value);

        // Assert
        expect(call, throwsA(isA<DeviceFailure>()));
      });
    });

    group('clearAll', () {
      test('clearAll should clear all the keys', () async {
        // Arrange
        final storage = MockFlutterSecureStorage();
        final service = LocalStorageService(storage: storage);

        when(() => storage.deleteAll()).thenAnswer((_) async {});

        // Act
        await service.clearAll();

        // Assert
        verify(() => storage.deleteAll()).called(1);
      });

      test('clearAll should throw DeviceFailure when an exception occurs',
          () async {
        // Arrange
        final storage = MockFlutterSecureStorage();
        final service = LocalStorageService(storage: storage);

        when(() => storage.deleteAll()).thenThrow(Exception());

        // Act
        final call = service.clearAll();

        // Assert
        expect(call, throwsA(isA<DeviceFailure>()));
      });
    });
  });
}
