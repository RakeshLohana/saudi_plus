import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/core/theme/app_color.dart';
import 'package:saudi_plus/core/utils/custom_text.dart';
import 'package:saudi_plus/l10n/app_local.dart';

class GridWidget extends StatelessWidget {
 const  GridWidget({
    super.key,
  });





  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> gridMap=[
      {"title":AppLocal.loc.car_services,"icon":MyAssets.mainGrid2},
      {"title":AppLocal.loc.shopping_stores,"icon":MyAssets.mainGrid1},
      {"title":AppLocal.loc.health_services,"icon":MyAssets.mainGrid5},
      {"title":AppLocal.loc.travel_and_tourism,"icon":MyAssets.mainGrid4},
      {"title":AppLocal.loc.beauty_care,"icon":MyAssets.mainGrid6},
      {"title":AppLocal.loc.restaurants_and_cafes,"icon":MyAssets.mainGrid3},
    ];
    return Expanded(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: gridMap.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.96,
          mainAxisSpacing: 10,
          crossAxisSpacing: 13,
        ),
        itemBuilder: (context, index) {
          return Container(

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10.6),
              boxShadow: [
               const BoxShadow(
                  offset: Offset(1, 1),
                  color:AppColor.shadowColor ,
                  blurRadius: 12
                )
              ],
              border: Border.all(color: Colors.black12),
              color:AppColor.whiteColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(gridMap[index]["icon"],height: 68,),
               const Gap(8),
                CustomText(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  maxLines: 2,
                  fontSize: 15,
                  text: gridMap[index]["title"]),
              ],
            ),
          );
        },
      ),
    );
  }
}
