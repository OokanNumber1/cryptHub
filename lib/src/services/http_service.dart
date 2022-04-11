import 'dart:convert';

import 'package:crypthub/src/constants/cmc_response.dart';
import 'package:crypthub/src/features/coin/model/cmc_token.dart';
import 'package:crypthub/src/features/coin/model/coin.dart';
import 'package:http/http.dart' as http;

abstract class NetworkAbstract {
  get(String url);
}

class HttpService implements NetworkAbstract {
  @override
  Future<List<Coin>> get(String url) async {
    final networkResponse = await http.get(Uri.parse(url));
    List decodedResponse = jsonDecode(networkResponse.body);
    return decodedResponse.map((coin) => Coin.fromJson(coin)).toList();
  }
}

class LocalService implements NetworkAbstract {
  @override
  List<CmcToken> get(String url) {
    List coinData = cmcListing['data'];
    return coinData.map((token) => CmcToken.fromJson(token)).toList();
  }
}
