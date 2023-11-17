class Coin {
  const Coin({
    required this.name,
    required this.priceUSD,
    required this.imageUrl,

    required this.hight24Hour,
    required this.low24Hour,
    required this.volume24Hour,
  });

  final String name;
  final double priceUSD;
  final String imageUrl;

  final double hight24Hour;
  final double low24Hour;
  final double volume24Hour;
}