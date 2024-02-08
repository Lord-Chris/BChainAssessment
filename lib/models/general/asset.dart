class Asset {
  final String name;
  final String symbol;
  final String icon;
  final double price;
  final double change;

  Asset({
    required this.name,
    required this.symbol,
    required this.icon,
    required this.price,
    required this.change,
  });
}

final mockAsset = Asset(
  name: 'Bitcoin',
  symbol: 'BTC',
  icon: 'assets/icons/bitcoin.png',
  price: 50000,
  change: 0.05,
);
