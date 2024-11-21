import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/features/dashboard/presentation/bloc/main_dashboard_bloc.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/categories_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/home_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/map_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/scan_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainDashboardBloc, MainDashboardState>(
      builder: (context, state) {


        int currentIndex = 0;
        if (state is TabChangedState) {
          currentIndex = state.currentIndex;
        }
        return BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: currentIndex,
          onTap: (index) {
            context.read<MainDashboardBloc>().add(ChangeTab(index));
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(MyAssets.tabBarIcon4),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(MyAssets.tabBarIcon3),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(MyAssets.tabBarIcon2),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(MyAssets.tabBarIcon1),
              label: 'Home',
            ),
          ],
        );

        // return BottomNavigationBar(
        //   selectedLabelStyle: TextStyle(color: Colors.black),
        //   unselectedLabelStyle: TextStyle(color: Colors.black),
        //   showSelectedLabels: true,
        //   showUnselectedLabels: true,
        //   items: [
        //     BottomNavigationBarItem(
        //
        //       icon: SvgPicture.asset(MyAssets.tabBarIcon1),
        //       label: 'Scan',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: SvgPicture.asset(MyAssets.tabBarIcon2),
        //       label: 'Categories',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: SvgPicture.asset(MyAssets.tabBarIcon3),
        //       label: 'Map',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: SvgPicture.asset(MyAssets.tabBarIcon4),
        //       label: 'Home',
        //     ),
        //   ],
        // );
      },
    );
  }
}


