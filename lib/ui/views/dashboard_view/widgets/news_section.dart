import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/components/_components.dart';
import '../../../shared/constants/_constants.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Trending news',
                  style: AppTextStyles.semiBold16,
                ),
              ),
              Text(
                'View more',
                style: AppTextStyles.semiBold14.copyWith(
                  color: AppColors.primary70,
                ),
              ),
            ],
          ),
          ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: REdgeInsets.only(top: 16),
            separatorBuilder: (context, index) {
              return Padding(
                padding: REdgeInsets.symmetric(vertical: 8),
                child: const Divider(
                  thickness: 2,
                  color: AppColors.dividerGrey,
                ),
              );
            },
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppNetworkImage(
                      url: AppConstants.mockImage,
                      size: Size.fromHeight(166),
                      borderRadius: 6,
                      fit: BoxFit.cover,
                    ),
                    Spacing.vertRegular(),
                    Text(
                      'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                      style: AppTextStyles.regular14,
                    ),
                    Spacing.vertSmall(),
                    Text(
                      'CoinDesk • 2h',
                      style: AppTextStyles.regular12.copyWith(
                        color: AppColors.gray20,
                      ),
                    )
                  ],
                );
              }
              return Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: AppNetworkImage(
                      url: AppConstants.mockImage,
                      size: Size.fromHeight(73),
                      borderRadius: 6,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Spacing.horizRegular(),
                  Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                          style: AppTextStyles.regular14,
                        ),
                        Spacing.vertSmall(),
                        Text(
                          'CoinDesk • 2h',
                          style: AppTextStyles.regular12.copyWith(
                            color: AppColors.gray20,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
