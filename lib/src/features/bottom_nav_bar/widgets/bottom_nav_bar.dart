import 'package:crypthub/src/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: AppDimensions.medium,
      notchMargin: AppDimensions.small,
      shape: const CircularNotchedRectangle(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.medium),
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            children: [
              buildNavigationItem(
                icon: Icons.home,
                label: 'Home',
              ),
              const Spacer(),
              buildNavigationItem(icon: Icons.favorite, label: 'Favourites'),
              const Spacer(flex: 2),
              buildNavigationItem(icon: Icons.new_releases, label: 'Discover'),
              const Spacer(),
              buildNavigationItem(icon: Icons.web_asset, label: 'DApp'),
            ],
          ),
        ),
      ),
    );
  }
}

GestureDetector buildNavigationItem(
    {IconData? icon, String? label, void Function()? onClicked}) {
  return GestureDetector(
    onTap: onClicked,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), Text(label!)]),
  );
}
