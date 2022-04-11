import 'package:crypthub/src/constants/app_strings.dart';
import 'package:crypthub/src/features/bottom_nav_bar/viewmodels/nav_bar_viewmodel.dart';
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

//final navBarProvider = ChangeNotifierProvider((ref) => NavBarViewModel());
final navBarProvider =
    StateNotifierProvider<NavBarViewModel, int>((ref) => NavBarViewModel());

class MyRoot extends StatelessWidget {
  const MyRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          // navigationViews[ref.watch(navBarProvider).index],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const MyFAB(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white70,
          elevation: AppDimensions.large,
          notchMargin: AppDimensions.small,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimensions.medium),
            child: SizedBox(
              height: kBottomNavigationBarHeight,
              child: Consumer(builder: (context, ref, child) {
                /*  BottomNavigationBar(
            elevation: 22,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'One'),
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Two'),
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'One'),
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Two'),
            ],
            type: BottomNavigationBarType.fixed,
          )*/
                final indexWatch = ref.watch(navBarProvider);
                final indexNotifier = ref.read(navBarProvider.notifier);
                return Row(
                  children: [
                    buildNavigationItem(
                        icon: Icons.home,
                        label: 'Home',
                        color: indexWatch == 0 ? Colors.blue : Colors.black,
                        onClicked: () => indexNotifier.navigate(0)),
                    const Spacer(),
                    buildNavigationItem(
                        icon: Icons.favorite,
                        label: 'Favourites',
                        color: indexWatch == 1 ? Colors.blue : Colors.black,
                        onClicked: () => indexNotifier.navigate(1)),
                    const Spacer(flex: 2),
                    buildNavigationItem(
                      icon: Icons.new_releases,
                      label: 'Discover',
                      color: indexWatch == 2 ? Colors.blue : Colors.black,
                      onClicked: () => indexNotifier.navigate(2),
                    ),
                    const Spacer(),
                    buildNavigationItem(
                      icon: Icons.web_asset,
                      label: 'DApp',
                      color: indexWatch == 3 ? Colors.blue : Colors.black,
                      onClicked: () => indexNotifier.navigate(3),
                    ),
                  ],
                );
              }),
            ),
          ),
        ));
  }
}

GestureDetector buildNavigationItem({
  IconData? icon,
  String? label,
  Color? color,
  Function()? onClicked,
}) {
  return GestureDetector(
    onTap: onClicked,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        color: color,
      ),
      Text(label!,
          style: TextStyle(
            color: color,
          ))
    ]),
  );
}
