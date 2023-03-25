class Environment {
  Environment._();

  static const String _apiCryptowatAssets = 'https://api.cryptowat.ch/assets';
  static const String _apiBinancePrice =
      'https://api.binance.com/api/v3/ticker/price';

  static Uri getCryptoAssetsUri() {
    return Uri.parse(_apiCryptowatAssets);
  }

  static Uri getBinancePriceUri() {
    return Uri.parse(_apiBinancePrice);
  }
}
