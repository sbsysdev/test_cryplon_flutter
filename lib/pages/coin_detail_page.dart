// Flutter
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Constants
import 'package:test_cryplon_flutter/constants/palette.dart';
import 'package:test_cryplon_flutter/models/coin.dart';
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_coinItem(coinService.selectedCoin)],
          ),
        ),
      ),
    );
  }

  _coinItem(Coin coin) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Palette.bg,
          child: CachedNetworkImage(
            imageUrl: coin.logoUrl,
            placeholder: (_, __) => const Icon(
              Icons.error_outline,
              color: Palette.error,
              size: 32,
            ),
            errorWidget: (_, __, ___) => const Icon(
              Icons.error_outline,
              color: Palette.error,
              size: 32,
            ),
          ),
        ),
        title: Text(coin.name,
            style: const TextStyle(
              fontSize: 20,
            )),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '(${coin.symbol})',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 16,
            ),
            Text('${coin.price} USD'),
          ],
        ),
      );
}
