// Flutter
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Constants
import 'package:test_cryplon_flutter/constants/palette.dart';
// Services
import 'package:test_cryplon_flutter/services/coin_service.dart';

class CoinDetailPage extends StatelessWidget {
  const CoinDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final coinService = Provider.of<CoinService>(context);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Palette.bg,
      body: Container(
        padding: const EdgeInsets.only(right: 8, left: 8),
        child: Text(coinService.selectedCoin.name),
      ),
    ));
  }
}
