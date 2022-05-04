import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:crypto_suggest/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TokenDetails extends ConsumerWidget {
  const TokenDetails({Key? key, required this.coin}) : super(key: key);
  //TokenDetails({Key? key, required this.tokenName}) : super(key: key);
  //var tokenName = tokenNameViewmodel;
  final CmcToken coin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = NumberFormat.compact();
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
              '\$' + formatter.format(coin.price),
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
            Row(
              children: [
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Text('Total Supply'),
                      const SizedBox(height: 12),
                      Text(
                        formatter.format(coin.totalSupply),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                )),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Text('Market Cap'),
                      const SizedBox(height: 12),
                      Text(
                        formatter.format(coin.marketCap),
                        style: const TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                )),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Text('Circ. Supply'),
                      const SizedBox(height: 12),
                      Text(
                        formatter.format(coin.circulatingSupply),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailCard(
                  coin: coin,
                  detailTitle: 'vol 24 %',
                  detailValue: coin.volumeChange24,
                ),
                detailCard(
                    coin: coin,
                    detailTitle: '24hrs %',
                    detailValue: coin.change24)
              ],
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
                  detailTitle: '30days %',
                  detailValue: coin.change30d,
                ),
                // Card(
                //   child: Padding(
                //     padding: const EdgeInsets.all(10.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         const Text('vol 24 %'),
                //         Text(
                //           coin.volumeChange24.toStringAsPrecision(4) + '%',
                //           style: TextStyle(
                //               color: coin.volumeChange24 > 16
                //                   ? Colors.green
                //                   : coin.volumeChange24 < 0
                //                       ? Colors.red
                //                       : Colors.grey,
                //               fontSize: coin.volumeChange24 > 15 ? 20 : 16,
                //               fontWeight: coin.volumeChange24 > 15
                //                   ? FontWeight.w600
                //                   : FontWeight.w400),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
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
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(detailTitle),
          Text(
            '${detailValue.toStringAsPrecision(4)}%',
            style: TextStyle(
                color: detailValue > 0 ? Colors.blue : Colors.red,
                fontSize: detailValue > 10 ? 28 : 20,
                fontWeight:
                    detailValue > 10 ? FontWeight.w700 : FontWeight.w400),
          ),
        ],
      ),
    ),
  );
}
