// Flutter
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Services
import 'package:test_cryplon_flutter/services/coin_service.dart';
// Constants
import 'constants/routes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CoinService())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cryplön',
          initialRoute: 'CoinList',
          routes: routes,
        ),
      );
}
