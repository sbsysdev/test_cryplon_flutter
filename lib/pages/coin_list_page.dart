// Flutter
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
// Models
import 'package:test_cryplon_flutter/models/coin.dart';
// Widgets
import 'package:test_cryplon_flutter/widgets/input.dart';
// Services
import 'package:test_cryplon_flutter/services/coin_service.dart';
// Constants
import 'package:test_cryplon_flutter/constants/palette.dart';

class CoinListPage extends StatefulWidget {
  const CoinListPage({super.key});

  @override
  State<CoinListPage> createState() => _CoinListPageState();
}

class _CoinListPageState extends State<CoinListPage> {
  final filterCtrl = TextEditingController();

  @override
  void initState() {
    final coinService = Provider.of<CoinService>(context, listen: false);
    coinService.getCoinList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final coinService = Provider.of<CoinService>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.bg,
          elevation: 0,
          title: Input(
            icon: Icons.search,
            placeholder: "Filter coin",
            textController: filterCtrl,
            onChanged: (value) => coinService.filterCoinList((item) =>
                item.price > 0 &&
                (item.name.toLowerCase().contains(value.toLowerCase()) ||
                    item.symbol.toLowerCase().contains(value.toLowerCase()))),
          ),
        ),
        backgroundColor: Palette.bg,
        body: Container(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: ListView.separated(
            itemBuilder: (_, index) =>
                _coinItem(coinService, coinService.filteredCoinList[index]),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: coinService.filteredCoinList.length,
          ),
        ),
      ),
    );
  }

  _coinItem(CoinService coinService, Coin coin) => ListTile(
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
        onTap: () {
          coinService.selectedCoin = coin;

          Navigator.pushNamed(context, 'CoinDetail');
        },
      );
}
