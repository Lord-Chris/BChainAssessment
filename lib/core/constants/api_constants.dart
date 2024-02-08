class APIConstants {
  APIConstants._();

  static const btcLatestBlock = 'https://blockchain.info/latestblock';
  static String xtzLatestBlock() => 'https://api.tzkt.io/v1/blocks';

  static String btcTransactions(hash) =>
      'https://blockchain.info/rawblock/$hash';
}
