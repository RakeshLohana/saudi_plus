import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/bottom_navigation.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/carousal_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/drawer_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/grid_widget.dart';

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({super.key});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SvgPicture.asset(
                  'assets/images/app_name.svg',
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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  //  Container(
                  //
                  //    decoration: BoxDecoration(
                  //      borderRadius: BorderRadius.circular(5),
                  //    ),
                  //    padding: EdgeInsets.all(10),
                  //    child: Icon(Icons.add),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for offers',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CarouselWithSmoothIndicator(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Explore Offers',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward)
      
                ],
              ),
      
              GridWidget(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}






