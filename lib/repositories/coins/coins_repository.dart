
import 'coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinRepository {
  CryptoCoinsRepository({required this.dio,});
  final Dio dio;

  @override
  Future<List<ShortCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,SOL,BNB,XRP,LINK,GAS&tsyms=USD,RUB');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final rubData = (e.value as Map<String, dynamic>)['RUB'] as Map<String, dynamic>;

      final priceUSD = usdData['PRICE'];
      final priceRUB =  (rubData['PRICE'] as num).toDouble();
      final imageUrl = usdData['IMAGEURL'];

      return ShortCoin(
        name: e.key,
        priceUSD: priceUSD,
        priceRUB: priceRUB,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      );
    }).toList();
    return cryptoCoinsList;
  }

  @override
    Future<Coin> getCoin(String name) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$name&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;

      final priceUSD = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      final volume = usdData['VOLUME24HOUR'];
      final hight = usdData['HIGH24HOUR'];
      final low = usdData['LOW24HOUR'];


      return Coin(
        name: e.key,
        priceUSD: priceUSD,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
        hight24Hour: hight,
        low24Hour: low,
        volume24Hour: volume
      );
    }).toList();
    return cryptoCoinsList[0];
  }
}