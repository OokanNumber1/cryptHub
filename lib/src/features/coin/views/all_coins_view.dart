import 'package:crypto_suggest/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:crypto_suggest/src/features/coin/views/coin_details_view.dart';
import 'package:crypto_suggest/src/features/favourites_token/viewmodel/favourite_viewmodel.dart';
import 'package:crypto_suggest/src/fixtures/cmc_new_response.dart';
//import 'package:crypto_suggest/src/features/favourites/viewmodel/favourite_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Expanded allCoinsView() {
  final formatter = NumberFormat.decimalPattern();
  return Expanded(
    child: Consumer(
      builder: (context, ref, child) {
        //final allCoinProvider = ref.watch(allCoinLocalVM);
        final allCoinProvider = ref.watch(allCoinViewmodel);
        return allCoinProvider.when(
          data: (tokenList) => RefreshIndicator(
            onRefresh: () => ref.refresh(allCoinViewmodel.future),
            child: ListView.builder(
                itemCount: cmcList['data'].length,
                itemBuilder: (_, index) => Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TokenDetails(
                                token: tokenList[index],
                              ),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
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
                                ref
                                    .read(favouriteChangeViewmodel)
                                    //.read(favouriteProvider.notifier)
                                    .favouriteAction(tokenList[index]);
                              },
                              child: Icon(
                                ref
                                        .watch(favouriteChangeViewmodel)
                                        .favouriteLocalList!
                                        .contains(tokenList[index])
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: ref
                                        .watch(favouriteChangeViewmodel)
                                        .favouriteLocalList!
                                        .contains(tokenList[index])
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
          ),
          error: (error, stck) => Text('$error'),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    ),
  );
}
