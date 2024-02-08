import 'package:stacked/stacked.dart';

import '../../../core/app/_app.dart';
import '../../../models/_models.dart';
import '../../../services/_services.dart';

class TransactionsViewModel extends BaseViewModel {
  final _log = getLogger('TransactionsViewModel');
  final _transactionsService = locator<ITransactionsService>();
  final _navigationService = locator<NavigationService>();

  List<ITransactionModel> transactions = [];

  void init(String type) {
    _fetchTransactions(type);
  }

  Future<void> _fetchTransactions(String type) async {
    try {
      setBusy(true);
      transactions = await _transactionsService.getTransactions(type);
    } on Exception catch (e) {
      _log.e('Error fetching transactions', e);
    } finally {
      setBusy(false);
    }
  }

  void navigateToTransactionDetail(ITransactionModel transaction) {
    _navigationService.navigateTo(
      Routes.transactionDetailView,
      arguments: TransactionDetailViewArguments(transaction: transaction),
    );
  }
}
