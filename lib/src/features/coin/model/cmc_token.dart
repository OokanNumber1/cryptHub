class CmcToken {
  CmcToken({
    required this.rank,
    required this.symbol,
    required this.name,
    required this.price,
    required this.change30d,
    required this.marketCap,
    required this.change24,
    required this.change7d,
    required this.totalSupply,
    required this.circulatingSupply,
    required this.volumeChange24,
  });
  String symbol, name;
  int rank;

  num circulatingSupply, totalSupply, volumeChange24, change30d;
  double price, change24, change7d, marketCap;

  factory CmcToken.fromJson(Map<String, dynamic> json) {
    return CmcToken(
      rank: json['cmc_rank'] ?? 0,
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
      price: json["quote"]["USD"]["price"] ?? 0.00,
      change24: json["quote"]["USD"]['percent_change_24h'] ?? 0.00,
      change7d: json["quote"]["USD"]['percent_change_7d'] ?? 0.00,
      change30d: json["quote"]["USD"]['percent_change_30d'] ?? 0.00,
      volumeChange24: json["quote"]["USD"]['volume_change_24h'] ?? 0.00,
      totalSupply: json['total_supply'] ?? 0.00,
      circulatingSupply: json['circulating_supply'] ?? 0.00,
      marketCap: json["quote"]["USD"]["market_cap"] ?? 0.00,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'symbol': symbol,
      'name': name,
      'price': price,
      'change24': change24,
      'change7d': change7d,
      'change30d': change30d,
      'volumeChange24': volumeChange24,
      'totalSupply': totalSupply,
      'circulatingSupply': circulatingSupply,
      'marketCap': marketCap,
    };
  }

  factory CmcToken.fromLocal(Map<String, dynamic> json) {
    return CmcToken(
        rank: json['rank'],
        symbol: json['symbol'],
        name: json['name'],
        price: json['price'],
        change30d: json['change30d'],
        marketCap: json['marketCap'],
        change24: json['change24'],
        change7d: json['change7d'],
        totalSupply: json['totalSupply'],
        circulatingSupply: json['circulatingSupply'],
        volumeChange24: json['volumeChange24']);
  }
}
