import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:saudi_plus/core/constants/assets.dart';
import 'package:saudi_plus/core/theme/app_color.dart';
import 'package:saudi_plus/core/utils/custom_text.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/carousal_widget.dart';
import 'package:saudi_plus/features/dashboard/presentation/widgets/grid_widget.dart';
import 'package:saudi_plus/l10n/app_local.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppLocal.init(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text:AppLocal.loc.hello,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColor.borderColor,
                  ),
                  CustomText(text:AppLocal.loc.username,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ],
              ),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: AppLocal.loc.select_region+": ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColor.borderColor


                      )


                    ),
                    TextSpan(
                      text: AppLocal.loc.jeddah,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )


            ],
          ),
         const Gap(10),

          Row(
            children: [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:  Border.all(
                        color: AppColor.borderColor,
                      ),
                      color: AppColor.whiteContainerColor,
                      boxShadow: [
                        const BoxShadow(
                            offset: Offset(1, 1),
                            color:AppColor.shadowColor ,
                            blurRadius: 6
                        )
                      ],
                    ),
                    child: TextField(

                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 16),
                        hintText: AppLocal.loc.search_for_offers,
                        prefixIcon:Icon(CupertinoIcons.search,size: 30,),
                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            // color: AppColor.borderColor,
                          ),
                        ),
                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            // color: AppColor.borderColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),

              Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteContainerColor,
                      boxShadow: [
                        const BoxShadow(
                            offset: Offset(1, 1),
                            color:AppColor.shadowColor ,
                            blurRadius: 6
                        )
                      ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.borderColor
                    )
                  ),
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(MyAssets.location_select,
                    height: 25,
                  )
              ),
            ],
          ),
          Gap(10),
          CarouselWithSmoothIndicator(),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocal.loc.explore_sections,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            const  Icon(Icons.arrow_forward)

            ],
          ),
          const Gap(10),

        const  GridWidget(),
        ],
      ),
    );
  }
}
