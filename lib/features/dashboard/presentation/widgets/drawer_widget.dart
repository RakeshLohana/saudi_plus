import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/core/theme/app_pallete.dart';
import 'package:saudi_plus/core/utils/custom_text.dart';

class DrawerWidget extends StatelessWidget {


   DrawerWidget({
    super.key,
  });

   List<Map<String,dynamic>> drawerMap=[
     {"leading":MyAssets.drawerIcon1, "title":"Profile", "trailing":Icons.arrow_forward_ios, },
     {"leading":MyAssets.drawerIcon2, "title":"My Points", "trailing":Container(child: Text("250"),),"isWidget":1},
     {"leading":MyAssets.drawerIcon3, "title":"My Orders", "trailing":Icons.arrow_forward_ios,},
     {"leading":MyAssets.drawerIcon4, "title":"Notifications", "trailing":Icons.arrow_forward_ios,},
     {"leading":MyAssets.drawerIcon5, "title":"My Addresses", "trailing":Icons.arrow_forward_ios,},
     {"leading":MyAssets.drawerIcon6, "title":"About Saudi Plus", "trailing":Icons.arrow_forward_ios,},
     {"leading":MyAssets.drawerIcon7, "title":"Terms and Conditions", "trailing":Icons.arrow_forward_ios,},
     {"leading":MyAssets.drawerIcon8, "title":" Usage Policy", "trailing":Icons.arrow_forward_ios,},
     {"leading":MyAssets.drawerIcon9, "title":"Technical Support", "trailing":Icons.arrow_forward_ios,},
     {"leading":MyAssets.drawerIcon10, "title":"Contact Us", "trailing":Icons.arrow_forward_ios,},
     {"leading":MyAssets.drawerIcon11, "title":"Language", "trailing": Icons.arrow_forward_ios},
     {"leading":MyAssets.drawerIcon12, "title":"Logout", "trailing":Icons.arrow_forward_ios,},


   ];


  @override
  Widget build(BuildContext context) {

    return Drawer(


      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
        child: ListView(
          children:  [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:NetworkImage("https://img.freepik.com/premium-photo/arabic-man_21730-4132.jpg") ,
                ),
                Gap(5),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "Mutab al anzi",
                          maxLines: 2,
                          fontSize: 25,overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(text: "username@example.com",
                          maxLines: 2,

                          fontSize: 12,overflow: TextOverflow.ellipsis,

                        ),
                        CustomText(text: "ID:  M-646",
                          maxLines: 2,
                          fontSize: 12,
                          color: AppPallete.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Gap(10),
           ListView.separated(
             physics: BouncingScrollPhysics(),
             shrinkWrap: true,
               itemBuilder: (context, index) => ListTile(
                 visualDensity: VisualDensity(vertical: -3),
                 trailing: drawerMap[index]["isWidget"]==1
                     ?drawerMap[index]["trailing"]
                     :Icon(drawerMap[index]["trailing"],size: 15,),
                 leading: SvgPicture.asset(drawerMap[index]["leading"]),
                 title: Text(drawerMap[index]["title"]),
               ),
               separatorBuilder: (context, index) => const Divider(),
               itemCount: drawerMap.length)

          ],
        ),
      ),
    );
  }
}
