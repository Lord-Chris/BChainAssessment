import '../../../core/app/_app.dart';
import '../../../core/constants/api_constants.dart';
import '../../../models/_models.dart';
import '../../_services.dart';

class TransactionsService extends ITransactionsService {
  final _networkService = locator<INetworkService>();

  @override
  Future<List<ITransactionModel>> getTransactions(String type) async {
    if (type == 'BTC') {
      final block = await _networkService.get(APIConstants.btcLatestBlock);
      final hash = block['hash'];

      final res = await _networkService.get(APIConstants.btcTransactions(hash));
      return (res['tx'] as List).map((tx) => BTCModel.fromMap(tx)).toList();
    } else {
      final res = await _networkService.get(APIConstants.xtzLatestBlock());
      return (res['transactions'] as List)
          .map((tx) => XTZModel.fromMap(tx))
          .toList();
    }
  }
}
