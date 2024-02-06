import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/constants/_constants.dart';

class MoversSection extends StatelessWidget {
  const MoversSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: REdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (_, __) => Spacing.horizSmall(),
            itemBuilder: (context, index) {
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
                    ),
                    const Spacer(),
                    Text(
                      'Bitcoin',
                      style: AppTextStyles.regular16,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Transform.flip(
                          flipY: true,
                          child: Icon(
                            Icons.arrow_outward,
                            size: 15.r,
                            color: AppColors.error70,
                          ),
                        ),
                        Text(
                          '1.76%',
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.error70,
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
