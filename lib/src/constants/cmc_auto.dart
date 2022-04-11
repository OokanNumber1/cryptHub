/*
class CoinAuto {
  CoinAuto({
    required this.status,
    required this.data,
  });
  late final Status status;
  late final List<Data> data;

  CoinAuto.fromJson(Map<String, dynamic> json) {
    status = Status.fromJson(json['status']);
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status.toJson();
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Status {
  Status({
    required this.timestamp,
    required this.errorCode,
    this.errorMessage,
    required this.elapsed,
    required this.creditCount,
    this.notice,
    required this.totalCount,
  });
  late final String timestamp;
  late final int errorCode;
  late final Null errorMessage;
  late final int elapsed;
  late final int creditCount;
  late final Null notice;
  late final int totalCount;

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = null;
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
    notice = null;
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['timestamp'] = timestamp;
    _data['error_code'] = errorCode;
    _data['error_message'] = errorMessage;
    _data['elapsed'] = elapsed;
    _data['credit_count'] = creditCount;
    _data['notice'] = notice;
    _data['total_count'] = totalCount;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    this.platform,
    required this.cmcRank,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    required this.lastUpdated,
    required this.quote,
  });
  late final int id;
  late final String name;
  late final String symbol;
  late final String slug;
  late final int numMarketPairs;
  late final String dateAdded;
  late final List<String> tags;
  late final int? maxSupply;
  late final int? circulatingSupply;
  late final int? totalSupply;
  late final Platform? platform;
  late final int cmcRank;
  late final int? selfReportedCirculatingSupply;
  late final double? selfReportedMarketCap;
  late final String lastUpdated;
  late final Quote quote;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    numMarketPairs = json['num_market_pairs'];
    dateAdded = json['date_added'];
    tags = List.castFrom<dynamic, String>(json['tags']);
    maxSupply = null;
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    platform = null;
    cmcRank = json['cmc_rank'];
    selfReportedCirculatingSupply = null;
    selfReportedMarketCap = null;
    lastUpdated = json['last_updated'];
    quote = Quote.fromJson(json['quote']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['symbol'] = symbol;
    _data['slug'] = slug;
    _data['num_market_pairs'] = numMarketPairs;
    _data['date_added'] = dateAdded;
    _data['tags'] = tags;
    _data['max_supply'] = maxSupply;
    _data['circulating_supply'] = circulatingSupply;
    _data['total_supply'] = totalSupply;
    _data['platform'] = platform;
    _data['cmc_rank'] = cmcRank;
    _data['self_reported_circulating_supply'] = selfReportedCirculatingSupply;
    _data['self_reported_market_cap'] = selfReportedMarketCap;
    _data['last_updated'] = lastUpdated;
    _data['quote'] = quote.toJson();
    return _data;
  }
}

class Platform {
  Platform({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.tokenAddress,
  });
  late final int id;
  late final String name;
  late final String symbol;
  late final String slug;
  late final String tokenAddress;

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    tokenAddress = json['token_address'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['symbol'] = symbol;
    _data['slug'] = slug;
    _data['token_address'] = tokenAddress;
    return _data;
  }
}

class Quote {
  Quote({
    required this.USD,
  });
  late final USD USD;

  Quote.fromJson(Map<String, dynamic> json) {
    USD = USD.fromJson(json['USD']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['USD'] = USD.toJson();
    return _data;
  }
}

class USD {
  USD({
    required this.price,
    required this.volume_24h,
    required this.volumeChange_24h,
    required this.percentChange_1h,
    required this.percentChange_24h,
    required this.percentChange_7d,
    required this.percentChange_30d,
    required this.percentChange_60d,
    required this.percentChange_90d,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.lastUpdated,
  });
  late final double price;
  late final double volume_24h;
  late final double volumeChange_24h;
  late final double percentChange_1h;
  late final double percentChange_24h;
  late final double percentChange_7d;
  late final double percentChange_30d;
  late final double percentChange_60d;
  late final double percentChange_90d;
  late final double marketCap;
  late final double marketCapDominance;
  late final double? fullyDilutedMarketCap;
  late final String lastUpdated;

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume_24h = json['volume_24h'];
    volumeChange_24h = json['volume_change_24h'];
    percentChange_1h = json['percent_change_1h'];
    percentChange_24h = json['percent_change_24h'];
    percentChange_7d = json['percent_change_7d'];
    percentChange_30d = json['percent_change_30d'];
    percentChange_60d = json['percent_change_60d'];
    percentChange_90d = json['percent_change_90d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['price'] = price;
    _data['volume_24h'] = volume_24h;
    _data['volume_change_24h'] = volumeChange_24h;
    _data['percent_change_1h'] = percentChange_1h;
    _data['percent_change_24h'] = percentChange_24h;
    _data['percent_change_7d'] = percentChange_7d;
    _data['percent_change_30d'] = percentChange_30d;
    _data['percent_change_60d'] = percentChange_60d;
    _data['percent_change_90d'] = percentChange_90d;
    _data['market_cap'] = marketCap;
    _data['market_cap_dominance'] = marketCapDominance;
    _data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    _data['last_updated'] = lastUpdated;
    return _data;
  }
}
*/