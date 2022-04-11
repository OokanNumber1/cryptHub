class Coin {
  // double percentChange1h, percentChange7d;
  //int id, rank, totalSupply, maxSupply;
  String name; //, symbol;

  Coin({
    required this.name,
    //required this.id,
    // required this.percentChange1h,
    // required this.percentChange7d,
    // required this.maxSupply,
    // required this.rank,
    // required this.symbol,
    // required this.totalSupply,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      // id: json['id'],
      // maxSupply: json['max_supply'],
      // rank: json['cmc_rank'],
      // symbol: json['symbol'],
      // totalSupply: json['total_supply'],
      // percentChange1h: json['percent_change_1h'],
      // percentChange7d: json['percent_change_7d'],
    );
  }
}
