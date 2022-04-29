import 'dart:convert';
import 'package:crypthub/src/constants/cmc_new_response.dart';
import 'package:crypthub/src/features/coin/model/cmc_token.dart';
import 'package:http/http.dart' as http;

abstract class NetworkAbstract {
  get(
    String url,
    //TokenForms toBeDisplayed,
  );
}
enum TokenForms { all, losers, gainers }

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
  
/*
    List<CmcToken> responseList =
        dataedResponse.map((e) => CmcToken.fromJson(e)).toList();

    switch (toBeDisplayed) {
      case TokenForms.all:
        return responseList;
      case TokenForms.losers:
        responseList.sort((a, b) => a.change24.compareTo(b.change24));
        return responseList;
      case TokenForms.gainers:
        responseList.sort((a, b) => a.change24.compareTo(b.change24));
        return responseList.reversed.toList();
      default:
        return [];
    }*/


/*
class LocalService implements NetworkAbstract {
  @override
  List<CmcToken> get(String url, TokenForms toBeDisplayed) {
    List coinData = cmcList['data'];
    final coinList = coinData.map((token) => CmcToken.fromJson(token)).toList();

    switch (toBeDisplayed) {
      case TokenForms.all:
        return coinList;
      case TokenForms.losers:
        coinList.sort((a, b) => a.change24.compareTo(b.change24));
        return coinList;
      case TokenForms.gainers:
        coinList.sort((a, b) => a.change24.compareTo(b.change24));
        return coinList.reversed.toList();
      default:
        return [];
    }
  }
}

*/
