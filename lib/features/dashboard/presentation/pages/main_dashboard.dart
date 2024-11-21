import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/features/dashboard/presentation/bloc/main_dashboard_bloc.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/categories_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/map_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/scan_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom_navigation.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/carousal_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/drawer_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/grid_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom%20navigation%20widgets/home_widget.dart';

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({super.key});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {


  static const List<Widget> bottomNavigationWidgets = [
    HomeWidget(),
    MapWidget(),
    CategoriesWidget(),
    ScanWidget(),


  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
                child: Container(
                  height: 225,
                  width: 225,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(MyAssets.drawerMenuIcon,



                    )
                  ),
                )),
          ),
          ),

          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SvgPicture.asset(
                  MyAssets.appNameIcon,
                  height: 40,
                ),
                // Text('App Name'),
              ],
            ),
          ),
          actions: [
          ],
        ),
        drawer: DrawerWidget(),
        body: BlocConsumer<MainDashboardBloc, MainDashboardState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if(state is TabChangedState){
              return bottomNavigationWidgets[state.currentIndex];

            }  else {
              return bottomNavigationWidgets[0];
            }

          },
        ),
        bottomNavigationBar:const BottomNavigationBarWidget(),
      ),
    );
  }
}







