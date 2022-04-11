import 'package:flutter_riverpod/flutter_riverpod.dart';

enum categoryEnum { allCoins, gainers, losers }
List<categoryEnum> categoryList = [
  categoryEnum.allCoins,
  categoryEnum.gainers,
  categoryEnum.losers
];

extension CategoryExtension on categoryEnum {
  String get chipText {
    switch (this) {
      case categoryEnum.allCoins:
        return 'Tokens';
      case categoryEnum.gainers:
        return 'Top Gainers';
      case categoryEnum.losers:
        return 'Top Losers';
      default:
        return '';
    }
  }
}

final categoryViewmodel = StateNotifierProvider((ref) {
  return CategoryNotifier();
});

class CategoryNotifier extends StateNotifier<int> {
  CategoryNotifier() : super(0);

  void changeIndex(int newIndex) {
    state = newIndex;
  }
}

// final categoryProvider = StateProvider<int>((ref) {
//   return 3;
// });
