import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/_services.dart';
import '../../ui/views/dashboard_view/dashboard_view.dart';
import '../../ui/views/login_view/login_view.dart';
import '../../ui/views/transaction_detail_view/transaction_detail_view.dart';
import '../../ui/views/transactions_view/transactions_view.dart';

/// Run "flutter pub run build_runner build --delete-conflicting-outputs"
/// Run "flutter pub run build_runner watch --delete-conflicting-outputs"

@StackedApp(
  routes: [
    AdaptiveRoute(page: LoginView, initial: true),
    AdaptiveRoute(page: DashboardView),
    AdaptiveRoute(page: TransactionsView),
    AdaptiveRoute(page: TransactionDetailView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),

    /// Core Services
    LazySingleton(classType: NetworkService, asType: INetworkService),
    LazySingleton(classType: LocalStorageService, asType: ILocalStorageService),

    /// Api Services
    LazySingleton(classType: TransactionsService, asType: ITransactionsService),
  ],
  logger: StackedLogger(),
)
class App {}
