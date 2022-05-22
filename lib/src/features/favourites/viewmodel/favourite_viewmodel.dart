import 'dart:convert';

import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:crypto_suggest/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final lclFavProvider = Provider<List<CmcToken>>((ref) {
//   return [];
// });
/*
class FavouriteNotifier extends StateNotifier<List<CmcToken>> {
  //FavouriteNotifier() : super({});
  FavouriteNotifier() : super([]);

List<CmcToken>? favouriteList ;
  List<CmcToken>? getfavouriteList () {
    var fromLcl =  localStorage.read(key: 'favKey');
   if(fromLcl != null){ List decoded = jsonDecode(fromLcl);
    favouriteList = decoded.map((token) => CmcToken.fromLocal(token)).toList();
    //state = [...favouriteList!];
    return favouriteList;
    }
    return [];
  }
  Set<CmcToken> favouriteSet = {};
  
  void favouriteAction(CmcToken token) async{
    //favouriteSet.contains(token) ? favouriteSet.remove(token) : favouriteSet.add(token);
    //state = [...favouriteSet.toList()];
    //state = favouriteSet.toList();
    //favouriteList = favouriteSet.toList();
    favouriteSet = favouriteList?.toSet() ?? {};
    favouriteSet.contains(token) ?removeFave(token) : addFave(token);
    state = [...favouriteSet.toList()];
    var localFav = favouriteSet.map((token) => token.toJson()).toList();
    String jsonString = jsonEncode(localFav);
    await localStorage.save(key: 'favKey', value: jsonString);
    
  }
  


  void removeFave(CmcToken token) {
    favouriteSet.remove(token);
    favouriteList = favouriteSet.toList();
    //state = [...favouriteSet.toList()];
    // state.remove(token);
    // state = state;
    // token.isFavourite = false;
  }

  void addFave(CmcToken token) {
    favouriteSet.add(token);
    favouriteList = favouriteSet.toList();
    //state = [...favouriteSet.toList()];
    // state.add(token);
    // state = state;
    // token.isFavourite = true;
  }
}

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, List<CmcToken>>((ref) {
  return FavouriteNotifier();
});
*/

class FavouriteChangeNotifier extends ChangeNotifier {
  final favLocalStorage = localStorage;
  //final favLocalStorage = prefStorage;
  late List<CmcToken>? favouriteLclList;

  List<CmcToken>? getfavouriteList() {
    var fromLcl = localStorage.read(key: 'favKey');
    //final fromLcl =  prefStorage.read(key: 'favKey') ;
    if (fromLcl != null) {
      List decoded = fromLcl;
      favouriteLclList =
          decoded.map((token) => CmcToken.fromLocal(token)).toList();
      //print('favouriteLclList ===>>>>>>======>>> $favouriteLclList');
      return favouriteLclList;
    }
    favouriteLclList = [];
    return [];
  }

  Future<void> favouriteAction(CmcToken token) async {
    Set<CmcToken> lclFaveSet = favouriteLclList!.toSet();
    lclFaveSet.contains(token)
        ? lclFaveSet.remove(token)
        : lclFaveSet.add(token);
    favouriteLclList = lclFaveSet.toList();
    await localStorage.save(key: 'favKey', value: favouriteLclList);
    notifyListeners();
  }
}

//! Gives error when i hot reload on the favourite page
final favouriteChangeViewmodel =
    ChangeNotifierProvider((ref) => FavouriteChangeNotifier());
