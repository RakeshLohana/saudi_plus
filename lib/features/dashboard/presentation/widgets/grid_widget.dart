import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/core/theme/app_pallete.dart';
import 'package:saudi_plus/core/utils/custom_text.dart';

class GridWidget extends StatelessWidget {
   GridWidget({
    super.key,
  });



  List<Map<String,dynamic>> gridMap=[
    {"title":"offers","icon":MyAssets.mainGrid1},
    {"title":"offers1","icon":MyAssets.mainGrid2},
    {"title":"offers2","icon":MyAssets.mainGrid3},
    {"title":"offers3","icon":MyAssets.mainGrid4},
    {"title":"offers4","icon":MyAssets.mainGrid5},
    {"title":"offers5","icon":MyAssets.mainGrid6},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: gridMap.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.76,
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
                  color:AppPallete.shadowColor ,
                  blurRadius: 12
                )
              ],
              border: Border.all(color: Colors.black12),
              color:AppPallete.whiteColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(gridMap[index]["icon"],height: 68,),
                Gap(7),
                CustomText(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
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
