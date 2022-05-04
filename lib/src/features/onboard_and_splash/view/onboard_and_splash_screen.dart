import 'package:crypto_suggest/root.dart';
import 'package:crypto_suggest/src/features/onboard_and_splash/viewmodel/onboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardView extends ConsumerWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardVM = ref.watch(onboardProvider);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () => onboardVM.validateOnboard(),
                child: const Text('Skip')),
          ),
          Image.asset('images/appicon.png'),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              child: PageView(
                  controller: ref.watch(onboardProvider).onboardController,
                  onPageChanged: (value) =>
                      ref.watch(onboardProvider).setOnboardIndex(value),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 24),
                        Text(
                          'Ease Your Crypto Analysis on Top 100 Tokens With a Easier View of Market Cap, Total Supply, Circulating Supply and Many more Token Info.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        //Image.asset('name'),
                        const SizedBox(height: 24),
                        const Text(
                          'Get To View Favourited Tokens Even When You Are Offline.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ])),
          const SizedBox(height: 24),
          SizedBox(
            width: 100,
            child: Row(children: [
              Container(
                height: 8,
                width: onboardVM.onboardIndex == 0 ? 52 : 24,
                color: onboardVM.onboardIndex == 0 ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 20),
              Container(
                height: 8,
                width: onboardVM.onboardIndex == 1 ? 52 : 24,
                color: onboardVM.onboardIndex == 1 ? Colors.blue : Colors.grey,
              )
            ]),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              onboardVM.onboardIndex == 0
                  ? onboardVM.onboardController.nextPage(
                      curve: Curves.linear,
                      duration: const Duration(milliseconds: 100))
                  : onboardVM.validateOnboard();
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.72, 48))),
            child: Text(onboardVM.onboardIndex == 0 ? 'Next' : 'Continue'),
          ),
        ],
      ),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/appicon.png'),
      ),
    );
  }
}
