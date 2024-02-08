import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
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
            itemCount: viewModel.assets.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => Spacing.vertRegular(),
            itemBuilder: (context, index) {
              final asset = viewModel.assets[index];
              return Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: asset.icon.endsWith('svg')
                        ? null
                        : AssetImage(asset.icon),
                    child: asset.icon.endsWith('svg')
                        ? SvgPicture.asset(asset.icon)
                        : null,
                  ),
                  Spacing.horizRegular(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          asset.name,
                          style: AppTextStyles.regular16,
                        ),
                        Text(
                          asset.symbol,
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
                        NumberFormat.currency(
                          symbol: '₦',
                          decimalDigits: 0,
                        ).format(asset.price),
                        style: AppTextStyles.regular16,
                      ),
                      Row(
                        children: [
                          Transform.flip(
                            flipY: asset.change.isNegative,
                            child: Icon(
                              Icons.arrow_outward,
                              size: 15.r,
                              color: asset.change.isNegative
                                  ? AppColors.error70
                                  : AppColors.primary70,
                            ),
                          ),
                          Text(
                            '${asset.change}%',
                            style: AppTextStyles.regular14.copyWith(
                              color: asset.change.isNegative
                                  ? AppColors.error70
                                  : AppColors.primary70,
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
