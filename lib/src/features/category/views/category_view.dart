import 'package:crypthub/src/features/category/viewmodel/category_viewmodel.dart';
import 'package:crypthub/src/features/coin/views/all_coins_view.dart';
import 'package:crypthub/src/features/coin/views/gainers.dart';
import 'package:crypthub/src/features/coin/views/losers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final categoryViewmodel = StateNotifierProvider((ref) {
//   return CategoryNotifier();
//});
class CategoryChip extends ConsumerWidget {
  const CategoryChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final categoryNotifierProvider = ref.watch(categoryViewmodel.notifier);
    final categoryNotifier = ref.watch(categoryViewmodel);

    final categoryViews = [allCoinsView(), gainersView(), losersView()];
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () =>
                  //ref.watch(categoryViewmodel.notifier).changeIndex(index),
                  ref.read(categoryViewmodel.notifier).changeIndex(index),
              child: Chip(
                label: Text(
                  categoryList[index].chipText,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: categoryNotifier == index
                    ? const Color(0xff0000ff)
                    : const Color(0xff000000),
              ),
            ),
          ),
        ),
        categoryViews[int.parse(categoryNotifier.toString())],
      ],
    );
  }
}
