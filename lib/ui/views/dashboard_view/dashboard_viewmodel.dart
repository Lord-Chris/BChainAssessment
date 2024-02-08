import 'package:stacked/stacked.dart';

import '../../../core/app/_app.dart';
import '../../../models/_models.dart';
import '../../shared/constants/_constants.dart';

class DashboardViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<Asset> get assets => [
        Asset(
          name: 'Bitcoin',
          symbol: 'BTC',
          icon: AppSvgAssets.bitcoin,
          price: 24500000,
          change: 1.76,
        ),
        Asset(
          name: 'Ethereum',
          symbol: 'ETH',
          icon: AppSvgAssets.ethereum,
          price: 4500,
          change: -6.76,
        ),
        Asset(
          name: 'Tezos',
          symbol: 'XTZ',
          icon: AppImgAssets.tezos,
          price: 4500,
          change: 9.06,
        ),
      ];

  List<Asset> get topMovers => [
        Asset(
          name: 'Ethereum',
          symbol: 'ETH',
          icon: AppSvgAssets.ethereum2,
          price: 4500,
          change: -1.76,
        ),
        Asset(
          name: 'Bitcoin',
          symbol: 'BTC',
          icon: AppSvgAssets.bitcoin,
          price: 24500000,
          change: 1.76,
        ),
        Asset(
          name: 'Solana',
          symbol: 'SOL',
          icon: AppSvgAssets.solana,
          price: 4500,
          change: 9.06,
        ),
      ];

  void goToTransactionsView(Asset asset) {
    if (asset.symbol != 'BTC' && asset.symbol != 'XTZ') return;
    _navigationService.navigateTo(
      Routes.transactionsView,
      arguments: TransactionsViewArguments(asset: asset),
    );
  }
}
