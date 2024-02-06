import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../shared/components/_components.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_textstyles.dart';
import '../../shared/constants/spacing.dart';
import 'transactions_viewmodel.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionsViewModel>.reactive(
      viewModelBuilder: () => TransactionsViewModel(),
      builder: (context, viewModel, child) {
        if (viewModel.isBusy) {
          return Material(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLoader.fullScreen(),
                  Spacing.vertExtraMedium(),
                  Spacing.vertSmall(),
                  Text(
                    'Fetching your {BTC} transactions',
                    style: AppTextStyles.regular18,
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'BTC transactions',
              style: AppTextStyles.semiBold16,
            ),
          ),
          body: ListView.separated(
            padding: REdgeInsets.fromLTRB(16, 0, 16, 24),
            itemCount: 200,
            separatorBuilder: (_, __) => Divider(
              height: 1,
              color: AppColors.black.withOpacity(.08),
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing.vertRegular(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '0000000000000bae09a7a393a8acded75aa67e46cb81f7acaa5ad94f9eacd103',
                          style: AppTextStyles.regular14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacing.horizRegular(),
                      Icon(
                        Icons.chevron_right,
                        size: 24.r,
                        color: AppColors.gray20,
                      ),
                    ],
                  ),
                  Spacing.vertSmall(),
                  Text(
                    '2019-08-24 • 15:43',
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.black.withOpacity(.56),
                    ),
                  ),
                  Spacing.vertRegular(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
