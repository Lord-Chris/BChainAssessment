import 'package:bchain_assessment/core/app/_app.dart';
import 'package:bchain_assessment/core/constants/api_constants.dart';
import 'package:bchain_assessment/models/_models.dart';
import 'package:bchain_assessment/services/_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/service_helpers.dart';

void main() {
  final btcTxRes = {
    'hash': '13a5b5ae3f7536f4a1be0006b1f6ab27ecf42f132585c2184391751d4f76930a',
    'ver': 1,
    'vin_sz': 1,
    'vout_sz': 5,
    'size': 392,
    'weight': 1460,
    'fee': 0,
    'relayed_by': '0.0.0.0',
    'lock_time': 0,
    'tx_index': 372110763732658,
    'double_spend': false,
    'time': 1707304258,
    'block_index': 829349,
    'block_height': 829349,
    'inputs': [
      {
        'sequence': 4294967295,
        'witness':
            '01200000000000000000000000000000000000000000000000000000000000000000',
        'script':
            '03a5a70c194d696e656420627920416e74506f6f6c20ab003c0146632910fabe6d6d7fb73bd28cc72603e55ed8e7d38b02d32d0d1ccaecf3fd92d7bf9dff2e0ee4fa1000000000000000000080b280b9230000000000',
        'index': 0,
        'prev_out': {
          'n': 4294967295,
          'script': '',
          'spending_outpoints': [
            {'n': 0, 'tx_index': 372110763732658}
          ],
          'spent': true,
          'tx_index': 0,
          'type': 0,
          'value': 0
        }
      }
    ],
    'out': [
      {
        'type': 0,
        'spent': false,
        'value': 546,
        'spending_outpoints': [],
        'n': 0,
        'tx_index': 372110763732658,
        'script': 'a91442402a28dd61f2718a4b27ae72a4791d5bbdade787',
        'addr': '37jKPSmbEGwgfacCr2nayn1wTaqMAbA94Z'
      },
    ]
  };

  final xtzTxRes = {
    'cycle': 0,
    'level': 0,
    'hash': 'string',
    'timestamp': '2019-08-24T14:15:22Z',
    'proto': 0,
    'payloadRound': 0,
    'blockRound': 0,
    'validations': 0,
    'deposit': 0,
    'rewardLiquid': 0,
    'rewardStakedOwn': 0,
    'rewardStakedShared': 0,
    'bonusLiquid': 0,
    'bonusStakedOwn': 0,
    'bonusStakedShared': 0,
    'fees': 0,
    'nonceRevealed': true,
    'reward': 0,
    'bonus': 0,
    'priority': 0,
    'baker': {},
    'lbEscapeVote': true,
    'lbEscapeEma': 0
  };
  group('Transactions Service -', () {
    late INetworkService networkService;
    late ITransactionsService service;

    setUpAll(() {
      // Register services
      registerServices();
      networkService = locator<INetworkService>();
      service = TransactionsService();
    });

    tearDownAll(() {
      // Unregister services
      unregisterService();
    });

    test(
        'when getTransactions is called with `BTC`, it should return `BTCModel`',
        () async {
      // Arrange
      when(() => networkService.get(APIConstants.btcLatestBlock))
          .thenAnswer((_) async => {'hash': '000'});
      when(() => networkService.get(APIConstants.btcTransactions('000')))
          .thenAnswer((_) async => {
                'tx': [btcTxRes]
              });

      // Act
      final result = await service.getTransactions('BTC');

      // Assert
      verify(() => networkService.get(any())).called(2);
      expect(result, isA<List<ITransactionModel>>());
      expect(result.length, 1);
      expect(result.any((item) => item is BTCModel), true);
      expect(result.any((item) => item is! XTZModel), true);
    });

    test(
        'when getTransactions is called with `XTZ`, it should return `XTZModel`',
        () async {
      // Arrange
      when(() => networkService.get(APIConstants.xtzLatestBlock()))
          .thenAnswer((_) async => [xtzTxRes]);

      // Act
      final result = await service.getTransactions('XTZ');

      // Assert
      verify(() => networkService.get(any())).called(1);
      expect(result, isA<List<ITransactionModel>>());
      expect(result.length, 1);
      expect(result.any((item) => item is! BTCModel), true);
      expect(result.any((item) => item is XTZModel), true);
    });
  });
}
