import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/constants/_constants.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My balance',
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.black.withOpacity(.6),
                ),
              ),
              Spacing.horizTiny(),
              Icon(
                Icons.visibility,
                size: 13.r,
                color: AppColors.black.withOpacity(.6),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              text: '₦',
              style: AppTextStyles.bold24,
              children: [
                TextSpan(
                  text: '1,000',
                  style: AppTextStyles.bold32.copyWith(
                    color: AppColors.black,
                  ),
                ),
                TextSpan(
                  text: '.00',
                  style: AppTextStyles.bold18.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
