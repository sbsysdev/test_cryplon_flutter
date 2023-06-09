// Flutter
import 'package:flutter/material.dart';
// Pages
import 'package:test_cryplon_flutter/pages/coin_list_page.dart';
import 'package:test_cryplon_flutter/pages/coin_detail_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'CoinList': (_) => const CoinListPage(),
  'CoinDetail': (_) => const CoinDetailPage()
};
