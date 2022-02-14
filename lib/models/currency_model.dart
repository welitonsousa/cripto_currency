class CurrenyModel {
  String name;
  String image;
  double currentPrice;
  double changePercent;

  CurrenyModel({
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.changePercent,
  });

  factory CurrenyModel.fromMap(Map<String, dynamic> map) {
    return CurrenyModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      currentPrice: map['current_price']?.toDouble() ?? 0.0,
      changePercent: map['price_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }
}
