import 'package:crypthub/src/features/coin/model/cmc_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteNotifier extends StateNotifier<Set<CmcToken>> {
  FavouriteNotifier() : super({});

  List<CmcToken> favouriteList = [];
  void favouriteAction(CmcToken token) {
    state.contains(token) ? state.remove(token) : state.add(token);
    favouriteList = state.toList();
  }

  void removeFave(CmcToken token) {
    state.remove(token);
    state = state;
    token.isFavourite = false;
  }

  void addFave(CmcToken token) {
    state.add(token);
    state = state;
    token.isFavourite = true;
  }
}

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, Set<CmcToken>>((ref) {
  return FavouriteNotifier();
});

final favIconProv = StateProvider<bool?>((ref) => null);

class FavouriteChangeNotifier extends ChangeNotifier {
  List favouriteList = [];
  Set favouriteSet = {};

  void favouriteAction(CmcToken token) {
    favouriteSet.contains(token)
        ? favouriteSet.remove(token)
        : favouriteSet.add(token);
    favouriteList = favouriteSet.toList();
    notifyListeners();
  }
}

final favouriteChangeViewmodel =
    ChangeNotifierProvider((ref) => FavouriteChangeNotifier());
