// Developer
import 'dart:developer' as developer;

class Coin {
  int id;
  String logoUrl;
  String name;
  String symbol;
  double price;

  Coin({
    required this.id,
    required this.logoUrl,
    required this.name,
    required this.symbol,
    required this.price,
  });
}

class CoinFactory {
  static List<Coin> getCoinListFromJsonResponses(
    Map<String, dynamic>? assets,
    List<dynamic>? prices,
  ) {
    assets ??= {};
    prices ??= [];

    List<Coin> coinList = List.of([]);

    developer.log('${prices[0]}');

    for (var asset in assets['result'] ?? []) {
      var coin = Coin(
        id: asset['id'] ?? 0,
        logoUrl: 'https://cryptologos.cc/logos/thumbs/${asset['sid']}.png',
        name: asset['name'] ?? 'Name',
        symbol: asset['symbol'] ?? 'SYMBOL',
        price: _getPrice(prices, asset['symbol']),
      );

      coinList.add(coin);
    }

    return coinList;
  }

  static double _getPrice(List<dynamic> prices, String symbol) {
    if (prices.isEmpty) return 0;

    final priceFound = prices.firstWhere(
      (element) =>
          element['symbol'].toString().toLowerCase() == '${symbol}usdt',
      orElse: () => ({'symbol': '', 'price': '0'}),
    );

    return double.parse(priceFound['price']);
  }
}
