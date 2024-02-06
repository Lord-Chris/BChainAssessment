import 'package:stacked/stacked.dart';

import '../../../core/app/_app.dart';

class DashboardViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToTransactionsView() {
    _navigationService.navigateTo(Routes.transactionsView);
  }
}
