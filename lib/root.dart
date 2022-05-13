import 'package:crypto_suggest/src/constants/app_strings.dart';
import 'package:crypto_suggest/src/features/bottom_nav_bar/viewmodels/nav_bar_viewmodel.dart';
import 'package:crypto_suggest/src/features/bottom_nav_bar/widgets/bottom_nav_bar.dart';
import 'package:crypto_suggest/src/features/favourites/viewmodel/favourite_viewmodel.dart';
import 'package:crypto_suggest/src/features/floating_action_button/widgets/floating_action_button.dart';
import 'package:crypto_suggest/src/features/onboard_and_splash/view/onboard_and_splash_screen.dart';
import 'package:crypto_suggest/src/features/onboard_and_splash/viewmodel/onboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/features/dapp/views/dapp_view.dart';
import 'src/features/favourites/views/favourites_view.dart';
import 'src/features/home/views/home_view.dart';
import 'src/features/discover/views/discover_view.dart';

class Root extends ConsumerWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  ScreenUtilInit(
      designSize: const Size(720, 1080),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ref.watch(onboardProvider).onboardViewed ? const MyRoot() : const OnboardView(),
        title: AppStrings.appName,
      ),
    );
  }
}


class MyRoot extends ConsumerWidget {
  const MyRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
ref.read(favouriteChangeViewmodel).getfavouriteList();
    final navigationViews = [
      const HomeView(),
      const FavouritesView(),
      const DiscoverView(),
      const DappView(),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.appName,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white24,
          centerTitle: true,
          elevation: 0,
        ),
        body: Consumer(
          builder: (context, ref, child) =>
              navigationViews[ref.watch(navBarProvider)],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const MyFAB(),
        bottomNavigationBar: const BottomNavBar(),);
  }
}


