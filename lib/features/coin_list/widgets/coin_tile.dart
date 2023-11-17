import 'package:flutter/material.dart';

import 'package:coins_list/repositories/coins/models/short_coin.dart';


class CoinTile extends StatelessWidget {
  const CoinTile({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final ShortCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      // leading: SvgPicture.asset(
      //   'assets/svg/bitcoin_logo.svg',
      //   height: 30,
      //   width: 30,
      // ),
      leading: Image.network(coin.imageUrl),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceUSD.toStringAsFixed(2)} USD\n${coin.priceRUB.round()} RUB',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin.name,
        );
      },
    );
  }
}
