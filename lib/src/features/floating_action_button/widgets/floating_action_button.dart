import 'package:crypto_suggest/src/features/coin/model/cmc_token.dart';
import 'package:crypto_suggest/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:crypto_suggest/src/features/coin/views/coin_details_view.dart';
import 'package:crypto_suggest/src/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFAB extends StatelessWidget {
  const MyFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showSearch(context: context, delegate: CustomSearchDelegate());
        // showDialog(
        //     context: context, builder: (context) => const SearchDialog());
      },
      child: const Icon(Icons.search),
    );
  }
}

class SearchDialog extends StatelessWidget {
  const SearchDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return AlertDialog(
      title: TextField(
        controller: searchController,
        decoration: const InputDecoration(hintText: 'Enter is to be Seached'),
      ),
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(width: 2, color: Colors.blue)),
      content:  SizedBox(
          height: MediaQuery.of(context).size.height * 0.56,
          width: double.infinity,
          //padding: const EdgeInsets.all(20),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20), border: Border.all(width: 2, color: Colors.blue)
          // ),
          child: Consumer(
            builder: (context, ref, child) {
              //final allCoinProvider = ref.watch(allCoinLocalVM);
              final allCoinProvider = ref.watch(allCoinViewmodel);
              List<CmcToken> suggestedSearchTokens = [];
              return allCoinProvider.when(
                  data: (allCoinList) {
                    searchController.text.isEmpty
                        ? allCoinList
                        : suggestedSearchTokens.addAll(allCoinList
                            .where(
                              (element) => element.name.toLowerCase().contains(
                                    searchController.text.toLowerCase(),
                                  ),
                            )
                            .toList());
                    //resultSearchTokens = suggestedSearchTokens;
                    return ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TokenDetails(
                                      coin: searchController.text.isEmpty
                                          ? allCoinList[index]
                                          : suggestedSearchTokens[index]))),
                          title: Text(searchController.text.isEmpty
                              ? allCoinList[index].name
                              : suggestedSearchTokens[index].name)),
                      itemCount: searchController.text.isEmpty
                          ? allCoinList.length
                          : suggestedSearchTokens.length,
                    );
                  },
                  error: (error, stck) => const Text('Error'),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ));
            },
            //child:
          )),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<CmcToken> {
  List<CmcToken> resultSearchTokens = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.cancel))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    //List<CmcToken> suggestedSearchTokens = [];
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(resultSearchTokens[index].name),
        onTap: () => TokenDetails(coin: resultSearchTokens[index]),
      ),
      itemCount: resultSearchTokens.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CmcToken> suggestedSearchTokens = [];
    return Consumer(
      builder: (context, ref, child) {
        //final allCoinProvider = ref.watch(allCoinLocalVM);
        final allCoinProvider = ref.watch(allCoinViewmodel);
        return allCoinProvider.when(
            data: (allCoinList) {
              query.isEmpty
                  ? allCoinList
                  : suggestedSearchTokens.addAll(allCoinList
                      .where(
                        (element) => element.name.toLowerCase().contains(
                              query.toLowerCase(),
                            ),
                      )
                      .toList());
              resultSearchTokens = suggestedSearchTokens;
              return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TokenDetails(
                                coin: query.isEmpty
                                    ? allCoinList[index]
                                    : suggestedSearchTokens[index]))),
                    title: Text(query.isEmpty
                        ? allCoinList[index].name
                        : suggestedSearchTokens[index].name)),
                itemCount: query.isEmpty
                    ? allCoinList.length
                    : suggestedSearchTokens.length,
              );
            },
            error: (error, stck) => const Text('Error'),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ));
      },
      //child:
    );
  }
}
