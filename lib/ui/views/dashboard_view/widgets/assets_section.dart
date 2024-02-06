import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/constants/_constants.dart';
import '../dashboard_viewmodel.dart';

class AssetsSection extends ViewModelWidget<DashboardViewModel> {
  const AssetsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Padding(
      padding: REdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'My assets',
                  style: AppTextStyles.semiBold16,
                ),
              ),
              TextButton(
                onPressed: viewModel.goToTransactionsView,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerRight,
                ),
                child: Text(
                  'See all',
                  style: AppTextStyles.semiBold14.copyWith(
                    color: AppColors.primary70,
                  ),
                ),
              ),
            ],
          ),
          Spacing.vertRegular(),
          ListView.separated(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => Spacing.vertRegular(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                  ),
                  Spacing.horizRegular(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bitcoin',
                          style: AppTextStyles.regular16,
                        ),
                        Text(
                          'BTC',
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.gray20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₦1,000',
                        style: AppTextStyles.regular16,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_outward,
                            size: 15.r,
                            color: AppColors.primary70,
                          ),
                          Text(
                            '1.76%',
                            style: AppTextStyles.regular14.copyWith(
                              color: AppColors.primary70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
