import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saudi_plus/core/constants/assets.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(color: Colors.grey),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(

          icon: SvgPicture.asset(MyAssets.tabBarIcon1),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(MyAssets.tabBarIcon2),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(MyAssets.tabBarIcon3),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(MyAssets.tabBarIcon4),
          label: 'Home',
        ),
      ],
    );
  }
}
