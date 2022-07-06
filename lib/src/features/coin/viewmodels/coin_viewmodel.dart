import 'package:crypto_suggest/src/repositories/token_repository.dart';
import 'package:crypto_suggest/src/services/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:crypto_suggest/src/constants/app_strings.dart';
import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:crypto_suggest/src/services/http_service.dart';

final allCoinViewmodel = FutureProvider<List<CmcToken>>((ref) async {
  if (await InternetConnectionChecker().hasConnection) {
    return TokenRepository(
            networkService: HttpService(),
            storageService: LocalStorage(storage: GetStorage()))
        .getAllTokens(AppStrings.coinUrl!);
  } else {
    return TokenRepository(
      networkService: HttpService(),
      storageService: LocalStorage(
        storage: GetStorage(),
      ),
    ).loadAllTokenFromLocal();
  }
});

final gainersViewmodel = FutureProvider((ref) async {
  if (await InternetConnectionChecker().hasConnection) {
    return TokenRepository(
            networkService: HttpService(),
            storageService: LocalStorage(storage: GetStorage()))
        .getGainerTokens(AppStrings.coinUrl!);
  } else {
    return TokenRepository(
      networkService: HttpService(),
      storageService: LocalStorage(
        storage: GetStorage(),
      ),
    ).loadGainerTokenFromLocal();
  }
});

final losersViewmodel = FutureProvider((ref) async {
  if (await InternetConnectionChecker().hasConnection) {
    return TokenRepository(
            networkService: HttpService(),
            storageService: LocalStorage(storage: GetStorage()))
        .getLoserTokens(AppStrings.coinUrl!);
  } else {
    return TokenRepository(
      networkService: HttpService(),
      storageService: LocalStorage(
        storage: GetStorage(),
      ),
    ).loadLoserTokenFromLocal();
  }
});
