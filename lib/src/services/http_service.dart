import 'dart:convert';
import 'package:crypto_suggest/src/constants/cmc_new_response.dart';
import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:http/http.dart' as http;

abstract class NetworkAbstract {
  get(String url);
}

class HttpService implements NetworkAbstract {
  @override
  Future<dynamic> get(
    String url,
  ) async {
    final networkResponse = await http.get(Uri.parse(url));
    final decodedResponse = jsonDecode(networkResponse.body);

    return decodedResponse['data'];
  }
}

class LocalService implements NetworkAbstract {
  @override
  List<CmcToken> get(String url) {
    List coinData = cmcList['data'];
    final coinList = coinData.map((token) => CmcToken.fromJson(token)).toList();

    switch (url) {
      case 'all':
        return coinList;
      case 'losers':
        coinList.sort((a, b) => a.change24.compareTo(b.change24));
        return coinList;
      case 'gainers':
        coinList.sort((a, b) => a.change24.compareTo(b.change24));
        return coinList.reversed.toList();
      default:
        return [];
    }
  }
}
