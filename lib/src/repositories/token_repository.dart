import 'package:crypto_suggest/src/constants/app_strings.dart';
import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:crypto_suggest/src/services/http_service.dart';
import 'package:crypto_suggest/src/services/storage_service.dart';

class TokenRepository {
  const TokenRepository({required this.networkService});
  final NetworkAbstract networkService;

  Future<List<CmcToken>> getAllTokens(String url) async {
    List decodedResponse = await networkService.get(url);
    await localStorage.save(key: AppStrings.tokensKey, value: decodedResponse);
    List<CmcToken> serialisedResponse =
        decodedResponse.map((token) => CmcToken.fromJson(token)).toList();
    return serialisedResponse;
  }

  Future<List<CmcToken>> getGainerTokens(String url) async{
    final List decodedResponse = await networkService.get(url);
    List<CmcToken> serialisedResponse =
        decodedResponse.map((token) => CmcToken.fromJson(token)).toList();
    serialisedResponse
        .sort((tokenA, tokenB) => tokenA.change24.compareTo(tokenB.change24));
    return serialisedResponse.reversed.toList();
  }

  Future<List<CmcToken>> getLoserTokens(String url) async {
     List decodedResponse = await networkService.get(url);
    List<CmcToken> serialisedResponse =
        decodedResponse.map((token) => CmcToken.fromJson(token)).toList();
    serialisedResponse
        .sort((tokenA, tokenB) => tokenA.change24.compareTo(tokenB.change24));
    return serialisedResponse;
  }
}
