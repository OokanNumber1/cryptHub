import 'package:crypthub/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Expanded gainersView() {
  return const Expanded(
    child: Text('Top Gainers'),
    /*
    child: Consumer(
      builder: (context, ref, child) {
        final gainersProvider = ref.watch(gainersViewmodel);
        return gainersProvider.when(
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
