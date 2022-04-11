import 'package:crypthub/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Expanded losersView() {
  return const Expanded(
    child: Text('Top Losers'),
    /*
    child: Consumer(
      builder: (context, ref, child) {
        final losersProvider = ref.watch(losersViewmodel);
        return losersProvider.when(
          data: (coinList) => ListView.builder(
              itemCount: coinList.length,
              itemBuilder: (_, index) => ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Text(coinList[index].name),
                  )),
          error: (error, stck) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        );
      },
    ),*/
  );
}
