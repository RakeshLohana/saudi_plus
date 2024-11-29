import 'package:flutter/material.dart';
import 'package:saudi_plus/core/utils/custom_text.dart';
import 'package:saudi_plus/l10n/app_local.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocal.init(context);

    List<Map<String, dynamic>> termsList=[

      {
        "title":AppLocal.loc.condition_1
      }

    ];

    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            itemBuilder: (context, index) =>
                Column(
                  children: [
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
                    ),                  ],
                )
            ,)
        ],
      ),


    );
  }
}
