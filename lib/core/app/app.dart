import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/_services.dart';
import '../../ui/views/dashboard_view/dashboard_view.dart';
import '../../ui/views/login_view/login_view.dart';

/// Run "flutter pub run build_runner build --delete-conflicting-outputs"
/// Run "flutter pub run build_runner watch --delete-conflicting-outputs"

@StackedApp(
  routes: [
    AdaptiveRoute(page: LoginView, initial: true),
    AdaptiveRoute(page: DashboardView),
    // AdaptiveRoute(page: SplashView),
    // AdaptiveRoute(page: SplashView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),

    /// Core Services
    // LazySingleton(
    //     classType: ConnectivityPlusService, asType: IConnectivityService),
    LazySingleton(classType: NetworkService, asType: INetworkService),
    LazySingleton(classType: LocalStorageService, asType: ILocalStorageService),

    /// Api Services
  ],
  logger: StackedLogger(),
)
class App {}
