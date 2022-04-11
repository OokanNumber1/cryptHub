class CmcToken {
  CmcToken({
    required this.rank,
    required this.symbol,
    required this.name,
    required this.price,
    required this.isFavourite,
    required this.marketCap,
    required this.change24,
    required this.change7d,
    required this.totalSupply,
    required this.circulatingSupply,
    required this.volumeChange24,
  });
  String symbol, name;
  int rank;
  bool isFavourite;
  num circulatingSupply, totalSupply, volumeChange24;
  double price, change24, change7d, marketCap;

  factory CmcToken.fromJson(Map<String, dynamic> json) {
    return CmcToken(
      isFavourite: false,
      rank: json['cmc_rank'] ?? 0,
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
      price: json["quote"]["USD"]["price"] ?? 0.00,
      change24: json["quote"]["USD"]['percent_change_24h'] ?? 0.00,
      change7d: json["quote"]["USD"]['percent_change_7d'] ?? 0.00,
      volumeChange24: json["quote"]["USD"]['volume_change_24h'] ?? 0.00,
      totalSupply: json['total_supply'] ?? 0.00,
      circulatingSupply: json['circulating_supply'] ?? 0.00,
      marketCap: json["quote"]["USD"]["market_cap"] ?? 0.00,
    );
  }
}
