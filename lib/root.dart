import 'package:crypthub/src/constants/app_strings.dart';
import 'package:crypthub/src/features/bottom_nav_bar/viewmodels/nav_bar_viewmodel.dart';
import 'package:crypthub/src/features/bottom_nav_bar/widgets/bottom_nav_bar.dart';
import 'package:crypthub/src/features/favourites/viewmodel/favourite_viewmodel.dart';
import 'package:crypthub/src/features/floating_action_button/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/features/dapp/views/dapp_view.dart';
import 'src/features/favourites/views/favourites_view.dart';
import 'src/features/home/views/home_view.dart';
import 'package:crypthub/src/constants/app_dimensions.dart';
import 'src/features/discover/views/discover_view.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyRoot(),
      title: AppStrings.appName,
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
        bottomNavigationBar: const BottomNavBar());
  }
}


