import 'package:crypto_suggest/src/constants/cmc_new_response.dart';
import 'package:crypto_suggest/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'coin_details_view.dart';

Expanded losersView() {
  return Expanded(child: Consumer(
    builder: (context, ref, child) {
      //final losersProvider = ref.watch(losersLocalVM);
      final losersProvider = ref.watch(losersViewmodel);
      return losersProvider.when(
        data: (loserList) =>
         RefreshIndicator(
          onRefresh: ()=>ref.refresh(losersViewmodel.future),
          child: 
          ListView.builder(
            itemCount: loserList.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => TokenDetails(token: loserList[index]),)),
              title: Text(loserList[index].name),
              trailing: Text(
                loserList[index].change24.toStringAsFixed(3) + '%',
                style: TextStyle(
                    color: loserList[index].change24 > 0
                        ? Colors.green
                        : Colors.red),
              ),
            ),
          ),
        ),
        error: (error, stackTrace) =>
            Center(child: Text('Error $error occurred')),
        loading: () => const Center(child: CircularProgressIndicator()),
      );
    },
  )
      );
}
