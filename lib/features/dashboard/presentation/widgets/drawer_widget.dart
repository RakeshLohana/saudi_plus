import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/core/theme/app_color.dart';
import 'package:saudi_plus/core/utils/custom_text.dart';
import 'package:saudi_plus/core/utils/language_choose.dart';
import 'package:saudi_plus/features/dashboard/presentation/bloc/main_dashboard_bloc.dart';
import 'package:saudi_plus/l10n/app_local.dart';

class DrawerWidget extends StatelessWidget {


   DrawerWidget({
    super.key,
  });




   @override
  Widget build(BuildContext context) {
    AppLocal.init(context);
    List<Map<String,dynamic>> drawerMap=[
      {"leading":MyAssets.drawerIcon1, "title":AppLocal.loc.profile, "trailing":Icons.arrow_forward_ios, },

      {"leading":MyAssets.drawerIcon2, "title":AppLocal.loc.my_points, "trailing":Container(child: Text("250"),),"isWidget":1},
      {"leading":MyAssets.drawerIcon3, "title":AppLocal.loc.my_orders, "trailing":Icons.arrow_forward_ios,},
      {"leading":MyAssets.drawerIcon4, "title":AppLocal.loc.notifications, "trailing":Icons.arrow_forward_ios,},
      {"leading":MyAssets.drawerIcon5, "title":AppLocal.loc.my_addresses, "trailing":Icons.arrow_forward_ios,},
      {"leading":MyAssets.drawerIcon6, "title":AppLocal.loc.about_saudi_plus, "trailing":Icons.arrow_forward_ios,},
      {"leading":MyAssets.drawerIcon7, "title":AppLocal.loc.terms_and_conditions, "trailing":Icons.arrow_forward_ios,},
      {"leading":MyAssets.drawerIcon8, "title":AppLocal.loc.usage_policy, "trailing":Icons.arrow_forward_ios,},
      {"leading":MyAssets.drawerIcon9, "title":AppLocal.loc.technical_support, "trailing":Icons.arrow_forward_ios,},
      {"leading":MyAssets.drawerIcon10, "title":AppLocal.loc.contact_us, "trailing":Icons.arrow_forward_ios,},
      // {"leading":MyAssets.drawerIcon11, "title":"Language", "trailing":SizedBox(
      //   width: 120,
      //   child: Row(
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //             color: AppPallete.primaryColor,
      //             borderRadius: BorderRadius.circular(4)
      //         ),
      //         height: 25,
      //         width: 62,
      //         child: Center(
      //           child: CustomText(text: "English",),
      //         ),
      //       ),
      //       Gap(5),
      //       Container(
      //         decoration: BoxDecoration(
      //             color: AppPallete.primaryColor,
      //             borderRadius: BorderRadius.circular(4)
      //         ),
      //         height: 25,
      //         width: 62,
      //         child: Center(
      //           child: CustomText(text: "Arbi",color: AppPallete.whiteColor,),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),"isWidget":1},
      // {"leading":MyAssets.drawerIcon12, "title":"Logout", "trailing":Icons.arrow_forward_ios,},


    ];

    return BlocBuilder<MainDashboardBloc, MainDashboardState>(
  builder: (context, state) {
    bool isSelected = false;
    if (state is LanguageColorChangeState) {
      isSelected = state.selectedColor;
    }
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
        child: ListView(
          children:  [
            const   Row(
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
                          color: AppColor.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Gap(10),
            Column(
              children: [
                ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      visualDensity: const VisualDensity(vertical: -3),
                      trailing: drawerMap[index]["isWidget"]==1
                          ?drawerMap[index]["trailing"]
                          :Icon(drawerMap[index]["trailing"],size: 15,),
                      leading: SvgPicture.asset(drawerMap[index]["leading"]),
                      title: Text(drawerMap[index]["title"]),
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: drawerMap.length),

                Divider(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(MyAssets.drawerIcon11),
                      Text(AppLocal.loc.language),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              LanguageChoose.chooseLanguage(context, "en");
                              Navigator.pop(context);
                              context.read<MainDashboardBloc>().add(LanguageColorChange(false));

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: isSelected ?AppColor.appPrimaryColor:AppColor.languageSelect,
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              height: 25,
                              width: 62,
                              child: Center(
                                child: CustomText(text: "English",),
                              ),
                            ),
                          ),
                          Gap(5),
                          GestureDetector(
                            onTap: () {
                              LanguageChoose.chooseLanguage(context, "ar");
                              Navigator.pop(context);
                              context.read<MainDashboardBloc>().add(LanguageColorChange(true));





                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: isSelected ?AppColor.appPrimaryColor:AppColor.languageSelect,
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              height: 25,
                              width: 62,
                              child: const Center(
                                child: CustomText(text: "عربي",color: AppColor.whiteColor,),
                              ),
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
                Divider(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset(MyAssets.drawerIcon12),
                      Gap(16),
                      CustomText(text:AppLocal.loc.logout,color: AppColor.redColor,),
                    ],
                  ),
                ),



              ],
            )

          ],
        ),
      ),
    );
  },
);
  }
}
