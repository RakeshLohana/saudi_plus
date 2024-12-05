// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/core/constants/route_strings.dart';

import '../../../../core/services/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed( const Duration(seconds: 1),() async{
      if(await PreferencesService.getLocationPermission()){
        Navigator.pushReplacementNamed(context, RouteStrings.loginScreen);
    }else {
        Navigator.pushReplacementNamed(context, RouteStrings.locationPermissionScreen);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(MyAssets.splash,height: 120,),

          ],
        ),
      ),


    );
  }
}
