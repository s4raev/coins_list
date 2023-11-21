import 'package:coins_list/repositories/coins/coins.dart';
import 'package:flutter/material.dart';

import 'package:coins_list/features/coin_list/widgets/widgets.dart';
import 'package:get_it/get_it.dart';




class CoinListScreen extends StatefulWidget {
  const CoinListScreen({
    super.key,
  });

  @override
  State<CoinListScreen> createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {
    List<ShortCoin>? _coinsList;


  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp'),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: (_coinsList == null)
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: _coinsList!.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, i) {
                  final coin = _coinsList![i];
                  return CoinTile(coin: coin);
                },
              ),
      ),
    );
  }
  Future<void> _loadCryptoCoins() async {
    _coinsList = await GetIt.I<AbstractCoinRepository>().getCoinsList();
    setState(() {});
  }

  Future<void> _handleRefresh() async {
    await _loadCryptoCoins();
  }

}
