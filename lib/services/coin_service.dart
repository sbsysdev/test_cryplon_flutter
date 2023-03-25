// Flutter
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Models
import 'package:test_cryplon_flutter/models/coin.dart';
// Constants
import 'package:test_cryplon_flutter/constants/environment.dart';

// Developer
import 'dart:developer' as developer;

class CoinService with ChangeNotifier {
  final List<Coin> _coinList = List.of([]);

  List<Coin> get coinList => _coinList;
  set coinList(List<Coin> value) {
    _coinList.clear();
    _coinList.addAll(value);

    _filteredCoinList.clear();
    _filteredCoinList.addAll(value);

    notifyListeners();
  }

  final List<Coin> _filteredCoinList = List.of([]);

  List<Coin> get filteredCoinList => _filteredCoinList;
  set filteredCoinList(List<Coin> value) {
    _filteredCoinList.clear();

    _filteredCoinList.addAll(value);

    notifyListeners();
  }

  late Coin _selectedCoin;

  Coin get selectedCoin => _selectedCoin;
  set selectedCoin(Coin coin) {
    _selectedCoin = coin;

    notifyListeners();
  }

  // Get coin list
  Future<bool> getCoinList() async {
    try {
      final responseAssets = await http.get(Environment.getCryptoAssetsUri());
      final responsePrices = await http.get(Environment.getBinancePriceUri());

      coinList = CoinFactory.getCoinListFromJsonResponses(
          json.decode(responseAssets.body), json.decode(responsePrices.body));

      return true;
    } catch (e) {
      developer.log(e.toString());
      return false;
    }
  }

  filterCoinList(bool Function(Coin) test) {
    filteredCoinList = coinList.where(test).toList();
  }
}
