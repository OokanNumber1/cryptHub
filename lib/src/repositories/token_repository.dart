import 'package:crypto_suggest/src/constants/app_strings.dart';
import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:crypto_suggest/src/services/http_service.dart';
import 'package:crypto_suggest/src/services/storage_service.dart';

class TokenRepository {
  const TokenRepository({required this.networkService, required this.storageService});
  final IHttpService networkService;
  final IStorageService storageService;

  Future<List<CmcToken>> getAllTokens(String url) async {
    List decodedResponse = await networkService.get(url);
    await storageService.save(key: AppStrings.tokensKey, value: decodedResponse);
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


  Future<List<CmcToken>> loadAllTokenFromLocal() async {
    final lclToken = await storageService.read(key: AppStrings.tokensKey);

    List storageList = lclToken.toList();
    List<CmcToken> strList =
        storageList.map((e) => CmcToken.fromJson(e)).toList();

    return strList;
  }

  Future<List<CmcToken>> loadGainerTokenFromLocal() async {
    final lclToken = await storageService.read(key: AppStrings.tokensKey);
    List storageList = lclToken.toList();
    List<CmcToken> strList =
        storageList.map((e) => CmcToken.fromJson(e)).toList();
    strList.sort((a, b) => a.change24.compareTo(b.change24));
    return strList.reversed.toList();
  }

  Future<List<CmcToken>> loadLoserTokenFromLocal() async {
    final losers = await storageService.read(key: AppStrings.tokensKey) as List;
    List<CmcToken> lslst = losers.map((e) => CmcToken.fromJson(e)).toList();
    lslst.sort((a, b) => a.change24.compareTo(b.change24));
    List<CmcToken> loserLst = lslst;
    return loserLst;
  }
}
