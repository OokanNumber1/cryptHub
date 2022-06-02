import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:crypto_suggest/src/services/http_service.dart';

class TokenRepository {
  const TokenRepository({required this.networkService});
  final NetworkAbstract networkService;


  List<CmcToken> getAllTokens(String url) {
    List decodedResponse = networkService.get(url);
    List<CmcToken> serialisedResponse =
        decodedResponse.map((token) => CmcToken.fromJson(token)).toList();

    return serialisedResponse;
  }

  List<CmcToken> getGainerTokens(String url) {
    final List decodedResponse = networkService.get(url);
    List<CmcToken> serialisedResponse =
        decodedResponse.map((token) => CmcToken.fromJson(token)).toList();
    serialisedResponse
        .sort((tokenA, tokenB) => tokenA.change24.compareTo(tokenB.change24));
    return serialisedResponse.reversed.toList();
  }

  List<CmcToken> getLoserTokens(String url) {
    final List decodedResponse = networkService.get(url);
    List<CmcToken> serialisedResponse =
        decodedResponse.map((token) => CmcToken.fromJson(token)).toList();
    serialisedResponse
        .sort((tokenA, tokenB) => tokenA.change24.compareTo(tokenB.change24));
    return serialisedResponse;
  }
}
