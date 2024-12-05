import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saudi_plus/core/common%20widgets/common_button.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/core/constants/route_strings.dart';
import 'package:saudi_plus/core/services/shared_preferences.dart';
import 'package:saudi_plus/core/theme/app_color.dart';
import 'package:saudi_plus/core/utils/custom_text.dart';
import 'package:saudi_plus/l10n/app_local.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocal.init(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      MyAssets.location_permission,
                      height: 200,
                    ),
                    const Gap(10),
                    CustomText(
                      text: AppLocal.loc.why_enable_location,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                      textAlign: TextAlign.center,

                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(5),
                    CustomText(
                      text: AppLocal.loc.to_determine_region,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                      color: AppColor.borderColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0), // Add padding for spacing
                    child: CustomElevatedButton(
                      text: AppLocal.loc.enable_location,
                      backgroundColor: AppColor.appPrimaryColor,
                      textSize: 22,
                      height: 70,
                      borderRadius: 12,

                      elevation: 0,
                      onPressed: () async {
                        // Add onPressed logic here
                        const permission = Permission.location;
                        if(await PreferencesService.getLocationPermission()) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              RouteStrings.loginScreen, (route) => false);
                        }
                        else{
                          await permission.request();
                          if(await permission.isGranted){
                            await PreferencesService.setLocationPermission(true);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                RouteStrings.loginScreen, (route) => false);
                          }
                        }
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          RouteStrings.loginScreen, (route) => false);
                    },
                    child: CustomText(
                      text: AppLocal.loc.skip,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.borderColor,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,

                    ),
                  ),
                  const Gap(10),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
