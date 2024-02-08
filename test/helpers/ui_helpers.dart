import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

Widget buildTestableWidget<T extends BaseViewModel>(Widget child, T viewModel) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (context, _) {
      return MaterialApp(
        home: ViewModelBuilder<T>.nonReactive(
          builder: (context, model, body) {
            return child;
          },
          viewModelBuilder: () => viewModel,
        ),
      );
    },
  );
}
