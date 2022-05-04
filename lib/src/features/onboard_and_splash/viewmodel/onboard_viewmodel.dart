import 'package:crypto_suggest/src/features/coin/viewmodels/coin_viewmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class OnboardNotifier extends StateNotifier<int>{
//    OnboardNotifier() : super (0) ;

//    void checkIndex(){
//      if (state == 1){
//        //final strg = ref
//      }
//    }
// }

class OnboardNotifier extends ChangeNotifier {

  PageController onboardController = PageController();

  int onboardIndex = 0;
  bool onboardViewed = localStorage.read(key: 'onboard') ?? false;
  void setOnboardIndex(int newIndex) {
    onboardIndex = newIndex;
    notifyListeners();
  }

  void validateOnboard() async {
    onboardViewed = true;
    await localStorage.save(key: 'onboard', value: onboardViewed);
    onboardController.dispose();
    notifyListeners();
  }
}

final onboardProvider = ChangeNotifierProvider((ref) {
  return OnboardNotifier();
});
