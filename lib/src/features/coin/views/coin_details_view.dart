import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:crypto_suggest/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TokenDetails extends ConsumerWidget {
  const TokenDetails({Key? key, required this.token}) : super(key: key);
  //TokenDetails({Key? key, required this.tokenName}) : super(key: key);
  //var tokenName = tokenNameViewmodel;
  final CmcToken token;

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
              token.name,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              '\$' + formatter.format(token.price),
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                    child: Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: Column(
                    children: [
                      Text(
                        'Total Supply',
                        style: TextStyle(fontSize: 24.sp),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        formatter.format(token.totalSupply),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                )),
                Card(
                    child: Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: Column(
                    children: [
                      Text(
                        'Market Cap',
                        style: TextStyle(fontSize: 24.sp),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        formatter.format(token.marketCap),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                )),
                Card(
                    child: Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: Column(
                    children: [
                      Text(
                        'Circ. Supply',
                        style: TextStyle(fontSize: 24.sp),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        formatter.format(token.circulatingSupply),
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
                  coin: token,
                  detailTitle: 'vol 24 %',
                  detailValue: token.volumeChange24,
                ),
                detailCard(
                    coin: token,
                    detailTitle: '24hrs %',
                    detailValue: token.change24)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailCard(
                  coin: token,
                  detailTitle: '7days %',
                  detailValue: token.change7d,
                ),
                detailCard(
                  coin: token,
                  detailTitle: '30days %',
                  detailValue: token.change30d,
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
            '${detailValue.toStringAsFixed(4)}%',
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
