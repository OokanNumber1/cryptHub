import 'package:crypthub/src/constants/cmc_response.dart';
import 'package:crypthub/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:crypthub/src/features/coin/views/coin_details_view.dart';
import 'package:crypthub/src/features/favourites/viewmodel/favourite_viewmodel.dart';
//import 'package:crypthub/src/features/favourites/viewmodel/favourite_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Expanded allCoinsView() {
  return Expanded(
    child: Consumer(
      builder: (context, ref, child) {
        final favProvR = ref.read(favouriteProvider.notifier);
        final favProvW = ref.watch(favouriteProvider.notifier);
        final allCoinProvider = ref.watch(allCoinLocalVM);
        return allCoinProvider.when(
          data: (coinList) => ListView.builder(
              itemCount: cmcListing['data'].length,
              itemBuilder: (_, index) => Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TokenDetails(
                              coin: coinList[index],
                            ),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: Text(coinList[index].rank.toString()),
                      title: Text(coinList[index].name),
                      subtitle: Row(
                        children: [
                          Text('\$${coinList[index].price.toStringAsFixed(2)}'),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(coinList[index].symbol),
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(favouriteChangeViewmodel)
                                  .favouriteAction(coinList[index]);
                              //favProvR.favouriteAction(coinList[index]);
                              // ref
                              //     .read(favouriteProvider.notifier)
                              //     .favouriteAction(coinList[index]);
                            },
                            child: Icon(ref
                                        .watch(favouriteChangeViewmodel)
                                        .favouriteSet
                                        .contains(coinList[index])
                                    ? Icons.favorite
                                    : Icons.favorite_border
                                // favProvW.favouriteList.contains(coinList[index])
                                //     ? Icons.favorite
                                //     : Icons.favorite_border

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
