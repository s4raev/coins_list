import 'package:flutter/material.dart';
import 'package:coins_list/repositories/coins/models/coin.dart';
import 'package:coins_list/features/coin_single/widgets/base_card.dart';
import 'package:coins_list/repositories/coins/coins_repository.dart';



class CoinSingleScreen extends StatefulWidget {
  const CoinSingleScreen({super.key});

  @override
  State<CoinSingleScreen> createState() => _CoinSingleScreenState();
}

class _CoinSingleScreenState extends State<CoinSingleScreen> {
  String? coinName;
  Coin? coinDetails;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    coinName = args as String;
    _loadCoin();
    setState(() {});
    super.didChangeDependencies();
  }

  Future<void> _loadCoin() async {
    coinDetails = await CryptoCoinsRepository().getCoin(coinName!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: (coinDetails == null)
      ? const Center(child: CircularProgressIndicator())
      : Center(
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.network(coinDetails!.imageUrl),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    coinDetails!.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BaseCard(
                    child: Center(
                      child: Text(
                        '${coinDetails!.priceUSD.toStringAsFixed(2)} \$',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  BaseCard(
                    child: Column(
                      children: [
                        const Text(
                          '24 hours stats',
                          style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                          _DataRow(
                          title: 'volume',
                          value: '${coinDetails!.volume24Hour.toStringAsFixed(2)} \$',
                        ),
                        const SizedBox(height: 6),
                        _DataRow(
                          title: 'Hight',
                          value: '${coinDetails!.low24Hour.toStringAsFixed(2)} \$',
                        ),
                        const SizedBox(height: 6),
                        _DataRow(
                          title: 'Low',
                          value: '${coinDetails!.hight24Hour.toStringAsFixed(2)} \$',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title)),
        const SizedBox(width: 32),
        Flexible(
          child: Text(value),
        ),
      ],
    );
  }
}

