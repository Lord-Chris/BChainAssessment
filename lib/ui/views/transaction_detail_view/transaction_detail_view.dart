import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../models/_models.dart';
import '../../shared/constants/_constants.dart';
import 'transaction_detail_viewmodel.dart';

class TransactionDetailView extends StatelessWidget {
  final ITransactionModel transaction;
  const TransactionDetailView({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionDetailViewModel>.nonReactive(
      viewModelBuilder: () => TransactionDetailViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Transaction details',
              style: AppTextStyles.semiBold16,
            ),
          ),
          body: ListView(
            padding: REdgeInsets.all(16),
            children: [
              _buildDetail('Hash', transaction.hash),
              Divider(height: 1, color: AppColors.black.withOpacity(.08)),
              _buildDetail('Time', transaction.parsedTime),
              Divider(height: 1, color: AppColors.black.withOpacity(.08)),
              if (transaction is BTCModel) ...[
                _buildDetail(
                  'Size',
                  (transaction as BTCModel).size.toString(),
                ),
                Divider(height: 1, color: AppColors.black.withOpacity(.08)),
                _buildDetail(
                  'Block index',
                  (transaction as BTCModel).blockIndex.toString(),
                ),
                Divider(height: 1, color: AppColors.black.withOpacity(.08)),
                _buildDetail(
                  'Height',
                  (transaction as BTCModel).blockHeight.toString(),
                ),
                Divider(height: 1, color: AppColors.black.withOpacity(.08)),
                _buildDetail(
                  'Received time',
                  (transaction as BTCModel).parsedTime,
                ),
              ],
              if (transaction is XTZModel) ...[
                _buildDetail(
                  'Level',
                  (transaction as XTZModel).level.toString(),
                ),
                Divider(height: 1, color: AppColors.black.withOpacity(.08)),
                _buildDetail(
                  'Reward',
                  (transaction as XTZModel).reward.toString(),
                ),
                Divider(height: 1, color: AppColors.black.withOpacity(.08)),
                _buildDetail(
                  'Bonus',
                  (transaction as XTZModel).bonus.toString(),
                ),
                Divider(height: 1, color: AppColors.black.withOpacity(.08)),
                _buildDetail(
                  'Fees',
                  (transaction as XTZModel).fees.toString(),
                ),
              ],
              Spacing.vertExtraMedium(),
              Spacing.vertSmall(),
              Row(
                children: [
                  SvgPicture.asset(AppSvgAssets.link),
                  Spacing.horizRegular(),
                  Expanded(
                    child: Text(
                      'View on blockchain explorer',
                      style: AppTextStyles.regular16.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Spacing.horizRegular(),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.black.withOpacity(.6),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetail(String title, String value) {
    return Column(
      children: [
        Spacing.vertRegular(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.regular16.copyWith(
                color: AppColors.black.withOpacity(.6),
              ),
            ),
            Spacing.horizLarge(),
            Expanded(
              flex: 5,
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: AppTextStyles.regular16.copyWith(
                  color: AppColors.black.withOpacity(.95),
                ),
              ),
            ),
          ],
        ),
        Spacing.vertRegular(),
      ],
    );
  }
}
