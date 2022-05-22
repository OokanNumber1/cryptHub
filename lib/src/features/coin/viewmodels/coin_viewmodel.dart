import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:crypto_suggest/src/constants/app_strings.dart';
import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:crypto_suggest/src/services/http_service.dart';
import 'package:crypto_suggest/src/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
final allCoinLocalVM = FutureProvider<List<CmcToken>>((ref) {
  return LocalService().get('all');
});
final gainersLocalVM = FutureProvider<List<CmcToken>>(
    (ref) => LocalService().get('gainers'));
final losersLocalVM = FutureProvider<List<CmcToken>>(
    (ref) => LocalService().get('losers'));
*/

final localStorage = LocalStorage(storage: GetStorage());
//final prefStorage = LocalStoragePrefs();

const tokensKey = 'tokens';
final allCoinViewmodel = FutureProvider<List<CmcToken>>((ref) async {
  if (await InternetConnectionChecker().hasConnection) {
    List allToken = await HttpService().get(
      AppStrings.coinUrl,
    );

    await localStorage.save(key: tokensKey, value: allToken);
    //await prefStorage.save(key: tokensKey, value: allToken);

    List<CmcToken> serialisedList =
        allToken.map((token) => CmcToken.fromJson(token)).toList();

    return serialisedList;
  } else {
    final lclToken = await localStorage.read(key: tokensKey);
    //final lclToken = await prefStorage.read(key: tokensKey);

    List storageList = lclToken.toList();
    List<CmcToken> strList =
        storageList.map((e) => CmcToken.fromJson(e)).toList();

    return strList;
  }
});

final gainersViewmodel = FutureProvider((ref) async {
  if (await InternetConnectionChecker().hasConnection) {
    List responseList = await HttpService().get(
      AppStrings.coinUrl,
    );

    List<CmcToken> gainerList =
        responseList.map((tkn) => CmcToken.fromJson(tkn)).toList();
    gainerList.sort((a, b) => a.change24.compareTo(b.change24));
    return gainerList.reversed.toList();
  } else {
    final lclToken = await localStorage.read(key: tokensKey);
    //final lclToken = await prefStorage.read(key: tokensKey);
    List storageList = lclToken.toList();
    List<CmcToken> strList =
        storageList.map((e) => CmcToken.fromJson(e)).toList();

    strList.sort((a, b) => a.change24.compareTo(b.change24));

    return strList.reversed.toList();
  }
});

final losersViewmodel = FutureProvider((ref) async {
  if (await InternetConnectionChecker().hasConnection) {
    final responseList = await HttpService().get(
      AppStrings.coinUrl,
    );

    List dataedList = responseList.toList();
    List<CmcToken> loserList =
        dataedList.map((token) => CmcToken.fromJson(token)).toList();
    loserList.sort((a, b) => a.change24.compareTo(b.change24));

    return loserList;
  } else {
    final losers = await localStorage.read(key: tokensKey) as List;
    //final losers = await prefStorage.read(key: tokensKey);

    List<CmcToken> lslst = losers.map((e) => CmcToken.fromJson(e)).toList();
    lslst.sort((a, b) => a.change24.compareTo(b.change24));
    List<CmcToken> loserLst = lslst;
    return loserLst;
  }
});
