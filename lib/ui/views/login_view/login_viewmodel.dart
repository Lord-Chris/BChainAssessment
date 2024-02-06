import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
