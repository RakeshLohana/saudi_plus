import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/core/theme/app_color.dart';
import 'package:saudi_plus/features/dashboard/presentation/bloc/main_dashboard_bloc.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/categories_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/home_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/map_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/scan_widget.dart';
import 'package:saudi_plus/l10n/app_local.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    double iconsSize=35;
    double fontSize=15;
    return BlocBuilder<MainDashboardBloc, MainDashboardState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is TabChangedState) {
          currentIndex = state.currentIndex;
        }

        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: fontSize, // Adjust font size for selected label
          unselectedFontSize: fontSize, // Adjust font size for unselected label
          selectedItemColor:AppColor. bottomLabel, // Color for selected item
          unselectedItemColor: Colors.grey, // Color for unselected item

          currentIndex: currentIndex,

          onTap: (index) {
            context.read<MainDashboardBloc>().add(ChangeTab(index));
          },
          items: [
            BottomNavigationBarItem(

              icon: SvgPicture.asset(
                height: iconsSize,

                currentIndex == 0
                    ? MyAssets.tabBarIcon4Selected // Selected icon for "Scan"
                    : MyAssets.tabBarIcon4, // Unselected icon for "Scan"
              ),
              label: AppLocal.loc.home,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: iconsSize,

                currentIndex == 1
                    ? MyAssets.tabBarIcon3Selected // Selected icon for "Categories"
                    : MyAssets.tabBarIcon3, // Unselected icon for "Categories"
              ),
              label: AppLocal.loc.map,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: iconsSize,

                currentIndex == 2
                    ? MyAssets.tabBarIcon2Selected // Selected icon for "Map"
                    : MyAssets.tabBarIcon2, // Unselected icon for "Map"
              ),
              label: AppLocal.loc.categories,
            ),
            BottomNavigationBarItem(

              icon: SvgPicture.asset(
                height: iconsSize,

                currentIndex == 3
                    ? MyAssets.tabBarIcon1Selected // Selected icon for "Home"
                    : MyAssets.tabBarIcon1, // Unselected icon for "Home"
              ),
              label: AppLocal.loc.scan,
            ),
          ],
        );
      },
    );
  }
}


