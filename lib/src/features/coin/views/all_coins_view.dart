import 'package:crypto_suggest/src/constants/cmc_response.dart';
import 'package:crypto_suggest/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:crypto_suggest/src/features/coin/views/coin_details_view.dart';
import 'package:crypto_suggest/src/features/favourites/viewmodel/favourite_viewmodel.dart';
//import 'package:crypto_suggest/src/features/favourites/viewmodel/favourite_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

Expanded allCoinsView() {
  final formatter = NumberFormat.decimalPattern();
  return Expanded(
    child: Consumer(
      builder: (context, ref, child) {
        //final allCoinProvider = ref.watch(allCoinLocalVM);
        final allCoinProvider = ref.watch(allCoinViewmodel);
        return allCoinProvider.when(
          data: (tokenList) => ListView.builder(
              itemCount: cmcListing['data'].length,
              itemBuilder: (_, index) => Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TokenDetails(
                              coin: tokenList[index],
                            ),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: Text(tokenList[index].rank.toString()),
                      title: Text(tokenList[index].name),
                      subtitle: Row(
                        children: [
                          Text(
                              '\$${formatter.format((tokenList[index].price))}'),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(tokenList[index].symbol),
                          GestureDetector(
                            onTap: () {
                              print('INU WIDGET ===>>> ${tokenList[index]}');
                              ref
                                  .read(favouriteChangeViewmodel)
                                  //.read(favouriteProvider.notifier)
                                  .favouriteAction(tokenList[index]);
                            },
                            child: Icon(
                              ref
                                      .watch(favouriteChangeViewmodel).favouriteLclList!
                                      .contains(tokenList[index])
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: ref
                                      .watch(favouriteChangeViewmodel).favouriteLclList!
                                      .contains(tokenList[index])
                                  ? Colors.blue
                                  : Colors.grey,

                              // ref
                              //         .read(favouriteProvider.notifier)
                              //         .favouriteList
                              //         .contains(coinList[index])
                              //     ? Icons.favorite
                              //     : Icons.favorite_border,
                              // color: coinList[index].isFavourite
                              //     ? Colors.yellow
                              //     : Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
          error: (error, stck) => Text('$error'),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    ),
  );
}
