import 'package:crypto_suggest/src/features/favourites/viewmodel/favourite_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(builder: (context, ref, child) {
        // final favouriteList = ref.read(favouriteProvider.notifier).getfavouriteList() ??[];
        //     final favoriteListState = ref.watch(favouriteProvider);
        final favouriteList =
            ref.watch(favouriteChangeViewmodel).favouriteLclList;
        //if (favouriteList!.isNotEmpty) {
        return favouriteList!.isEmpty
            ? const Center(
                child: Text('No Favourite Items Yet,'),
              )
            : ListView.builder(
                itemCount: favouriteList.length,
                //ref.watch(favouriteProvider.notifier).favouriteList.length,
                itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () => ref
                                    .read(favouriteChangeViewmodel)
                                    //.read(favouriteProvider.notifier)
                                    .favouriteAction(favouriteList[index]),
                                child: Icon(
                                  favouriteList.contains(index)
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                  color: favouriteList.contains(index)
                                      ? Colors.blue
                                      : Colors.grey,
                                )),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(favouriteList[index].symbol),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Text('vol24%: '),
                                    Text(
                                      favouriteList[index]
                                          .volumeChange24
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                        color: favouriteList[index]
                                                    .volumeChange24 >
                                                20
                                            ? Colors.green
                                            : favouriteList[index]
                                                        .volumeChange24 <
                                                    0
                                                ? Colors.red
                                                : Colors.grey,
                                        fontSize: favouriteList[index]
                                                    .volumeChange24 >
                                                20
                                            ? 26
                                            : 20,
                                        fontWeight: favouriteList[index]
                                                    .volumeChange24 >
                                                15
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Text('24hrs%: '),
                                    Text(
                                      favouriteList[index]
                                          .change24
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                        color: favouriteList[index].change24 > 0
                                            ? Colors.blue
                                            : Colors.red,
                                        fontSize:
                                            favouriteList[index].change24 > 10
                                                ? 24
                                                : 16,
                                        fontWeight:
                                            favouriteList[index].change24 > 10
                                                ? FontWeight.w700
                                                : FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('7days%: '),
                                    Text(
                                      favouriteList[index]
                                          .change7d
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                          color:
                                              favouriteList[index].change7d > 0
                                                  ? Colors.blue
                                                  : Colors.red,
                                          fontSize:
                                              favouriteList[index].change7d > 10
                                                  ? 24
                                                  : 16,
                                          fontWeight:
                                              favouriteList[index].change7d > 10
                                                  ? FontWeight.w700
                                                  : FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
        // }
        // return SizedBox();
      }),
    );
  }
}
