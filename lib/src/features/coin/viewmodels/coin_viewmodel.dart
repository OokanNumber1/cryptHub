import 'package:crypthub/src/constants/app_strings.dart';
import 'package:crypthub/src/features/coin/model/cmc_token.dart';
import 'package:crypthub/src/features/coin/model/coin.dart';
import 'package:crypthub/src/services/http_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allCoinViewmodel = FutureProvider<List<Coin>>((ref) async {
  return await HttpService().get(AppStrings.coinUrl);
});

final allCoinLocalVM =
    FutureProvider<List<CmcToken>>((ref) => LocalService().get(''));

final gainersViewmodel = FutureProvider((ref) async {
  return await HttpService().get(AppStrings.gainersUrl);
});

final losersViewmodel = FutureProvider((ref) async {
  return await HttpService().get(AppStrings.losersUrl);
});
