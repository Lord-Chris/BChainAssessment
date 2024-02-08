import 'package:bchain_assessment/core/app/_app.dart';
import 'package:bchain_assessment/services/_services.dart';
import 'package:mocktail/mocktail.dart';

/// Stacked services mock
class MockDialogService extends Mock implements DialogService {}

class MockNavigationService extends Mock implements NavigationService {}

/// Services mock
class MockApiService extends Mock implements INetworkService {}

class MockLocalStorageService extends Mock implements ILocalStorageService {}

class MockTransactionsService extends Mock implements ITransactionsService {}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

DialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

INetworkService getAndRegisterNetworkService() {
  _removeRegistrationIfExists<INetworkService>();
  final service = MockApiService();
  locator.registerSingleton<INetworkService>(service);
  return service;
}

ILocalStorageService getAndRegisterLocalStorageService() {
  _removeRegistrationIfExists<ILocalStorageService>();
  final service = MockLocalStorageService();
  locator.registerSingleton<ILocalStorageService>(service);
  return service;
}

ITransactionsService getAndRegisterTransactionsService() {
  _removeRegistrationIfExists<ITransactionsService>();
  final service = MockTransactionsService();
  locator.registerSingleton<ITransactionsService>(service);
  return service;
}

void registerServices() {
  getAndRegisterDialogService();
  getAndRegisterNavigationService();
  getAndRegisterNetworkService();
  getAndRegisterLocalStorageService();
  getAndRegisterTransactionsService();
}

void unregisterService() {
  locator.unregister<DialogService>();
  locator.unregister<NavigationService>();
  locator.unregister<INetworkService>();
  locator.unregister<ILocalStorageService>();
  locator.unregister<ITransactionsService>();
}
