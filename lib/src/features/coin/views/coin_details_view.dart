import 'package:crypthub/src/features/coin/model/cmc_token.dart';
import 'package:crypthub/src/features/coin/model/coin.dart';
import 'package:crypthub/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenDetails extends ConsumerWidget {
  const TokenDetails({Key? key, required this.coin}) : super(key: key);
  //TokenDetails({Key? key, required this.tokenName}) : super(key: key);
  //var tokenName = tokenNameViewmodel;
  final CmcToken coin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coin.name,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              '\$' + coin.price.toStringAsFixed(3),
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('vol 24 %'),
                    Text(
                      coin.volumeChange24.toStringAsFixed(3),
                      style: TextStyle(
                          color: coin.volumeChange24 > 16
                              ? Colors.green
                              : coin.volumeChange24 < 0
                                  ? Colors.red
                                  : Colors.grey,
                          fontSize: coin.volumeChange24 > 15 ? 26 : 20,
                          fontWeight: coin.volumeChange24 > 15
                              ? FontWeight.w600
                              : FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailCard(
                  coin: coin,
                  detailTitle: '7days %',
                  detailValue: coin.change7d,
                ),
                detailCard(
                    coin: coin,
                    detailTitle: '24hrs %',
                    detailValue: coin.change24)
              ],
            )
          ],
        ),
      ),
    );
  }
}

detailCard({
  required coin,
  required String detailTitle,
  required num detailValue,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(detailTitle),
          Text(
            '${detailValue.toStringAsFixed(3)}%',
            style: TextStyle(
                color: detailValue > 0 ? Colors.blue : Colors.red,
                fontSize: detailValue > 10 ? 24 : 16,
                fontWeight:
                    detailValue > 10 ? FontWeight.w700 : FontWeight.w400),
          ),
        ],
      ),
    ),
  );
}
