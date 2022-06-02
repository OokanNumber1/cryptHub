import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:crypto_suggest/src/fixtures/cmc_new_response.dart';
import 'package:crypto_suggest/src/services/storage_service.dart';

class LocalRepository {
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

 Future<List<CmcToken>> loadFromLocal()async{
    const tokensKey = 'tokens';
    final lclToken = await localStorage.read(key: tokensKey);

    List storageList = lclToken.toList();
    List<CmcToken> strList =
        storageList.map((e) => CmcToken.fromJson(e)).toList();

    return strList;
  }
}