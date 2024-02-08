import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/constants/_constants.dart';
import '../dashboard_viewmodel.dart';

class MoversSection extends ViewModelWidget<DashboardViewModel> {
  const MoversSection({super.key});

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Column(
      children: [
        Padding(
          padding: REdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Today’s Top Movers',
                  style: AppTextStyles.semiBold16,
                ),
              ),
              Text(
                'See all',
                style: AppTextStyles.semiBold14.copyWith(
                  color: AppColors.primary70,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 127.h,
          child: ListView.separated(
            itemCount: viewModel.topMovers.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: REdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (_, __) => Spacing.horizSmall(),
            itemBuilder: (context, index) {
              final asset = viewModel.topMovers[index];
              return Container(
                width: 150.r,
                padding: REdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.black.withOpacity(.12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Spacer(),
                    Text(
                      asset.name,
                      style: AppTextStyles.regular16,
                    ),
                    const Spacer(),
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
                          '${asset.change.abs().toStringAsFixed(2)}%',
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
              );
            },
          ),
        ),
        Spacing.vertSmall(),
      ],
    );
  }
}
