
import 'package:coins_list/repositories/coins/models/models.dart';

abstract class AbstractCoinRepository {
  Future<List<ShortCoin>> getCoinsList();
  Future<Coin> getCoin(String coinName);
}