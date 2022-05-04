import 'dart:convert';

class CmcToken {
  // CmcToken({
  //   required this.rank,
  //   required this.symbol,
  //   required this.name,
  //   required this.price,
  //   required this.change30d,
  //   required this.marketCap,
  //   required this.change24,
  //   required this.change7d,
  //   required this.totalSupply,
  //   required this.circulatingSupply,
  //   required this.volumeChange24,
  // });
  String symbol;
   String name;
  int rank;

  num circulatingSupply; 
  num totalSupply; 
  num volumeChange24; 
  num change30d;
  double price; 
  double change24; 
  double change7d; 
  double marketCap;
  CmcToken({
    required this.symbol,
    required this.name,
    required this.rank,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.volumeChange24,
    required this.change30d,
    required this.price,
    required this.change24,
    required this.change7d,
    required this.marketCap,
  });

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
  /*

  CmcToken copyWith({
    String? symbol,
    String? name,
    int? rank,
    num? circulatingSupply,
    num? totalSupply,
    num? volumeChange24,
    num? change30d,
    double? price,
    double? change24,
    double? change7d,
    double? marketCap,
  }) {
    return CmcToken(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      circulatingSupply: circulatingSupply ?? this.circulatingSupply,
      totalSupply: totalSupply ?? this.totalSupply,
      volumeChange24: volumeChange24 ?? this.volumeChange24,
      change30d: change30d ?? this.change30d,
      price: price ?? this.price,
      change24: change24 ?? this.change24,
      change7d: change7d ?? this.change7d,
      marketCap: marketCap ?? this.marketCap,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'symbol': symbol,
      'name': name,
      'rank': rank,
      'circulatingSupply': circulatingSupply,
      'totalSupply': totalSupply,
      'volumeChange24': volumeChange24,
      'change30d': change30d,
      'price': price,
      'change24': change24,
      'change7d': change7d,
      'marketCap': marketCap,
    };
  }

  factory CmcToken.fromMap(Map<String, dynamic> map) {
    return CmcToken(
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      rank: map['rank']?.toInt() ?? 0,
      circulatingSupply: map['circulatingSupply'] ?? 0,
      totalSupply: map['totalSupply'] ?? 0,
      volumeChange24: map['volumeChange24'] ?? 0,
      change30d: map['change30d'] ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
      change24: map['change24']?.toDouble() ?? 0.0,
      change7d: map['change7d']?.toDouble() ?? 0.0,
      marketCap: map['marketCap']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CmcToken.fromJson(String source) => CmcToken.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CmcToken(symbol: $symbol, name: $name, rank: $rank, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, volumeChange24: $volumeChange24, change30d: $change30d, price: $price, change24: $change24, change7d: $change7d, marketCap: $marketCap)';
  }
  */

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CmcToken &&
      other.symbol == symbol &&
      other.name == name &&
      other.rank == rank &&
      other.circulatingSupply == circulatingSupply &&
      other.totalSupply == totalSupply &&
      other.volumeChange24 == volumeChange24 &&
      other.change30d == change30d &&
      other.price == price &&
      other.change24 == change24 &&
      other.change7d == change7d &&
      other.marketCap == marketCap;
  }

  @override
  int get hashCode {
    return symbol.hashCode ^
      name.hashCode ^
      rank.hashCode ^
      circulatingSupply.hashCode ^
      totalSupply.hashCode ^
      volumeChange24.hashCode ^
      change30d.hashCode ^
      price.hashCode ^
      change24.hashCode ^
      change7d.hashCode ^
      marketCap.hashCode;
  }
}
