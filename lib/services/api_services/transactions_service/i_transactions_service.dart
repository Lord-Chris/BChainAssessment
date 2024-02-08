import '../../../models/_models.dart';

abstract class ITransactionsService {
  Future<List<ITransactionModel>> getTransactions(String type);
}
