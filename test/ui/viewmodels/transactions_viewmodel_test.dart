import 'package:bchain_assessment/core/app/_app.dart';
import 'package:bchain_assessment/models/_models.dart';
import 'package:bchain_assessment/services/_services.dart';
import 'package:bchain_assessment/ui/views/transactions_view/transactions_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/service_helpers.dart';

void main() {
  group('TransactionsViewModel -', () {
    late ITransactionsService transactionsService;
    late NavigationService navigationService;

    setUpAll(() {
      // Register services
      registerServices();
      transactionsService = locator<ITransactionsService>();
      navigationService = locator<NavigationService>();
    });

    tearDownAll(() {
      // Unregister services
      unregisterService();
    });

    test(
        'when fetchTransactions is called with `BTC`, it should contain only `BTCModel`',
        () async {
      // Arrange
      final viewModel = TransactionsViewModel();
      when(() => transactionsService.getTransactions('BTC'))
          .thenAnswer((_) async => [mockBTCModel]);

      // Act
      await viewModel.init('BTC');

      // Assert
      expect(viewModel.transactions, isA<List<ITransactionModel>>());
      expect(viewModel.transactions.length, 1);
      expect(viewModel.transactions.any((item) => item is BTCModel), true);
      expect(viewModel.transactions.any((item) => item is! XTZModel), true);
    });

    test(
        'when fetchTransactions is called with `XTZ`, it should contain only `XTZModel`',
        () async {
      // Arrange
      final viewModel = TransactionsViewModel();
      when(() => transactionsService.getTransactions('XTZ'))
          .thenAnswer((_) async => [mockXTZModel]);

      // Act
      await viewModel.init('XTZ');

      // Assert
      expect(viewModel.transactions, isA<List<ITransactionModel>>());
      expect(viewModel.transactions.length, 1);
      expect(viewModel.transactions.any((item) => item is! BTCModel), true);
      expect(viewModel.transactions.any((item) => item is XTZModel), true);
    });

    test('when init is called and an error is thrown, it should log the error',
        () async {
      final viewModel = TransactionsViewModel();
      // Arrange
      when(() => transactionsService.getTransactions('BTC'))
          .thenThrow(const InternetFailure());

      // Act
      await viewModel.init('BTC');

      // Assert
      expect(viewModel.transactions, isA<List<ITransactionModel>>());
      expect(viewModel.transactions.length, 0);
      expect(viewModel.isBusy, false);
    });

    test('when navigateToTransactionDetail is called, it should navigate',
        () async {
      // Arrange
      final viewModel = TransactionsViewModel();
      final transaction = mockBTCModel;

      // Act
      viewModel.navigateToTransactionDetail(transaction);

      // Assert
      verify(() => navigationService.navigateTo(
            Routes.transactionDetailView,
            arguments: any(named: 'arguments'),
          ));
    });
  });
}
