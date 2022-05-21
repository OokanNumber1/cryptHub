import 'package:crypto_suggest/src/constants/cmc_new_response.dart';
import 'package:crypto_suggest/src/constants/cmc_response.dart';
import 'package:crypto_suggest/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:crypto_suggest/src/features/coin/views/coin_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Expanded gainersView() {
  return Expanded(
    child: Consumer(
      builder: (context, ref, child) {
        //final gainersProvider = ref.watch(gainersLocalVM);
        final gainersProvider = ref.watch(gainersViewmodel);
        return gainersProvider.when(
            data: (gainerList) => 
            RefreshIndicator(
              onRefresh: () => ref.refresh(gainersViewmodel.future),
              child: 
            ListView.builder(
                  itemCount: gainerList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: Text(
                        gainerList[index].change24.toStringAsFixed(3) + '%',
                        style: TextStyle(
                            color: gainerList[index].change24 > 0
                                ? Colors.green
                                : Colors.red),
                      ),
                      title: Text(gainerList[index].name),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TokenDetails(token: gainerList[index]),
                          )),
                    );
                  }),
            ),
            error: (err, stck) => Text(err.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ));
      },
    ),
  );
}
