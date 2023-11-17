import 'package:coins_list/features/coin_list/coin_list.dart';
import 'package:coins_list/features/coin_single/coin_single.dart';


final routes = {
  '/': (context) => const CoinListScreen(),
  '/coin': (context) => const CoinSingleScreen(),
};
