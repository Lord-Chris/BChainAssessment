import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../core/extensions/_extensions.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/_constants.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Form(
                  key: formKey,
                  child: ListView(
                    shrinkWrap: true,
                    padding:
                        REdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    children: [
                      Spacing.vertMedium(),
                      Text(
                        'Log in to your account',
                        style: AppTextStyles.semiBold20,
                      ),
                      Spacing.vertSmall(),
                      Text(
                        'Welcome back! Please enter your registered email address to continue',
                        style: AppTextStyles.regular16,
                      ),
                      Spacing.vertMedium(),
                      AppTextField(
                        label: 'Email address',
                        hint: 'Enter email address',
                        keyboardType: TextInputType.emailAddress,
                        validator: context.validateEmail,
                      ),
                      Spacing.vertRegular(),
                      AppTextField(
                        label: 'Password',
                        hint: 'Enter password',
                        obscureText: !viewModel.isPasswordVisible,
                        maxLines: 1,
                        keyboardType: TextInputType.visiblePassword,
                        validator: context.validatePassword,
                        suffix: TextButton(
                          onPressed: viewModel.togglePasswordVisibility,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerRight,
                            minimumSize: const Size(0, 0),
                          ),
                          child: Text(
                            viewModel.isPasswordVisible ? 'HIDE' : 'SHOW',
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.gray700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: AppButton(
                  label: 'Continue',
                  isBusy: viewModel.isBusy,
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;
                    viewModel.login();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
