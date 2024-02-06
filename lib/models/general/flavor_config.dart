import 'package:equatable/equatable.dart';

import '../../ui/shared/constants/_constants.dart';

enum Flavor {
  dev,
  staging,
  prod;

  static Flavor fromValue(String? value) {
    switch (value) {
      case 'dev':
        return Flavor.dev;
      case 'staging':
        return Flavor.staging;
      case 'prod':
        return Flavor.prod;
      default:
        return Flavor.prod;
    }
  }
}

class FlavorConfig extends Equatable {
  final String appName;
  final Flavor flavor;

  static FlavorConfig shared = FlavorConfig.create();

  factory FlavorConfig.create({
    Flavor flavor = Flavor.dev,
  }) {
    switch (flavor) {
      case Flavor.dev:
        return shared = const FlavorConfig._dev();
      case Flavor.staging:
        return shared = const FlavorConfig._staging();
      case Flavor.prod:
        return shared = const FlavorConfig._prod();
    }
  }

  const FlavorConfig._dev()
      : appName = '[DEV] ${AppConstants.appName}',
        flavor = Flavor.dev;

  const FlavorConfig._staging()
      : appName = '[STAGING] ${AppConstants.appName}',
        flavor = Flavor.staging;

  const FlavorConfig._prod()
      : appName = AppConstants.appName,
        flavor = Flavor.prod;

  @override
  List<Object?> get props => [appName, flavor];
}
