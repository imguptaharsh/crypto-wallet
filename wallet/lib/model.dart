class CryptoInfo {
  final String name;
  final double price;
  final double percentChange24h;

  CryptoInfo({
    required this.name,
    required this.price,
    required this.percentChange24h,
  });

  factory CryptoInfo.fromJson(Map<String, dynamic> json) {
    return CryptoInfo(
      name: json['name'],
      price: json['quote']['USD']['price'],
      percentChange24h: json['quote']['USD']['percent_change_24h'],
    );
  }
}
