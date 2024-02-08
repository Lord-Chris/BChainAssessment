import 'package:stacked/stacked.dart';

import '../../../core/app/_app.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> login() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    setBusy(false);
    _navigationService.navigateTo(Routes.dashboardView);
  }
}
