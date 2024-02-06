import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../shared/constants/_constants.dart';
import 'dashboard_viewmodel.dart';
import 'widgets/assets_section.dart';
import 'widgets/balance_widget.dart';
import 'widgets/movers_section.dart';
import 'widgets/news_section.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.fit_screen_sharp),
            title: Text(
              'Explore',
              style: AppTextStyles.bold18,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              Badge(
                offset: const Offset(2, -2),
                largeSize: 10,
                padding: REdgeInsets.all(10),
                smallSize: 10,
                child: IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          body: ListView(
            children: const [
              BalanceWidget(),
              Divider(thickness: 2, color: AppColors.dividerGrey),
              AssetsSection(),
              Divider(thickness: 2, color: AppColors.dividerGrey),
              MoversSection(),
              Divider(thickness: 2, color: AppColors.dividerGrey),
              NewsSection(),
            ],
          ),
        );
      },
    );
  }
}
