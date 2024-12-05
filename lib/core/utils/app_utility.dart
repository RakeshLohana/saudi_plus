// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:saudi_plus/core/constants/route_strings.dart';
import 'package:saudi_plus/core/theme/app_color.dart';
import 'package:saudi_plus/core/utils/app_strings.dart';
import 'package:saudi_plus/core/utils/general.dart';



abstract class AppUtility {
  const AppUtility._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static const defaultButtonHeight = 50.0;
  static const defaultToolbarHeight = kToolbarHeight + 14;
  static const defaultLeadingHeight = kToolbarHeight + horizontalPadding;
  static const horizontalPadding = 20.0;
  static const verticalPadding = 15.0;
  static const defaultButtonBorderRadius = 6.0;
  static const defaultBorderRadius = 6.0;
  static const bottomBarHeight = 90.0;
  static const defaultappBarSize = kToolbarHeight +10;
  static const defaultTextFieldHeight = 4.0 ;

  static const emptyBox = SizedBox.shrink();
  static const loader = Center(child: CircularProgressIndicator.adaptive());

  static void snackBar({String? message, int seconds = 2, Color backgroundColor=AppColor.appPrimaryColor}) =>
      ScaffoldMessenger.of(navigatorKey.currentContext!)
        ..removeCurrentSnackBar()
        ..showSnackBar(
            SnackBar(
              content: Text(
                message??"no message",
                style: Theme.of(navigatorKey.currentContext!).textTheme.titleSmall!.copyWith(
                    color: AppColor.appPrimaryColor,
                    fontSize: 12
                ),
              ),
              duration: Duration(seconds: seconds),
              backgroundColor: backgroundColor,

            )
        );


  // static void blockDialog<T>(BuildContext context, Completer<T> completer) =>
  //     context.showBlockDialog(dismissCompleter: completer);

  static backButton(BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(200),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            border: Border.all(color: Theme.of(context).dividerColor)
        ),
        child: Center(child: Icon(Icons.arrow_back, color: Theme.of(context).brightness == Brightness.light ? AppColor.black : AppColor.whiteColor)),
      ),
    );
  }
  static Future<String> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      return picked.format(context);
    }
    return TimeOfDay.now().format(context);
  }
  static smallBackButton(BuildContext context){
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: (){
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(200),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: horizontalPadding+10.0, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(200),
          //border: Border.all(color: Theme.of(context).dividerColor)
        ),
        child: const Center(child: Icon(Icons.arrow_back_ios_new_outlined, size: 22, color: AppColor.black)),
      ),
    );
  }

  static appbarBackButton(BuildContext context){
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: (){
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(200),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: horizontalPadding, right: 14, top: 23, bottom: 5),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(200),
            border: Border.all(color: Theme.of(context).dividerColor)
        ),
        child: Center(child: Icon(Icons.arrow_back_ios_new_outlined, size: 19, color: Theme.of(context).inputDecorationTheme.iconColor)),
      ),
    );
  }

  static Future<List<File>?> pickFiles()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    List<File>? files;
    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
    }
    return files;
  }

  static Future<XFile?> imageFromCamera()async{
    var image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 40);
    return image;
  }

  static Future<XFile?> imageFromGallery()async{
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 30);
    return image;
  }



  static Future<XFile?> pickImage(BuildContext context) async {
    final image = await showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (_){
          return Wrap(
            children: [
              Column(
                children: [
                  const Gap(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            borderRadius: BorderRadius.circular(200)
                        ),
                      )
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          final image = await imageFromCamera();
                          if(image != null){
                            Navigator.of(context).pop(image);
                          }else{
                            Navigator.pop(context);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(Icons.camera),
                            Text(
                              'Camera',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final image = await imageFromGallery();
                          if(image != null){
                            Navigator.of(context).pop(image);
                          }else{
                            Navigator.pop(context);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(Icons.photo),
                            Text(
                              'Gallery',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                ],
              ),
            ],
          );
        }
    );
    return image;
  }

  static Future<XFile?> videoFromCamera()async{
    var video = await ImagePicker()
        .pickVideo(source: ImageSource.camera);
    return video;
  }

  static Future<XFile?> videoFromGallery()async{
    var video = await ImagePicker()
        .pickVideo(source: ImageSource.gallery);
    return video;
  }

  static Future<XFile?> pickVideo(BuildContext context) async {
    final image = await showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (_){
          return Wrap(
            children: [
              Column(
                children: [
                  const Gap(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            borderRadius: BorderRadius.circular(200)
                        ),
                      )
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          final video = await videoFromCamera();
                          if(video != null){
                            Navigator.of(context).pop(video);
                          }else{
                            Navigator.pop(context);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(Icons.camera),
                            Text(
                              'Camera',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final video = await videoFromGallery();
                          if(video != null){
                            Navigator.of(context).pop(video);
                          }else{
                            Navigator.pop(context);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(Icons.photo),
                            Text(
                              'Gallery',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                ],
              ),
            ],
          );
        }
    );
    return image;
  }

  ///dialog
  static Route<Object?> dialogBuilderMessage(
      BuildContext context, Object? arguments) {

    return RawDialogRoute<void>(
      // barrierColor: const Color(0xffF8F6F1),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {

        return AlertDialog(
          title: Center(
              child: Text(
                '$arguments',
                style: Theme.of(context).textTheme.bodyLarge,
              )),
        );
      },
    );
  }





  // static Future showVersionUpdatePopup({bool isIos=false}) async{
  //   return await showDialog(
  //     context: navigatorKey.currentContext!,
  //     barrierDismissible: false,
  //     barrierLabel: 'version',
  //     barrierColor: const Color(0x88000000),
  //     builder: (context) {
  //       return PopScope(
  //         canPop: false,
  //         child: AlertDialog(
  //           title: Text(
  //             AppString.newUpdateAvailable.t(context),
  //             style: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                 fontSize: 20
  //             ),
  //           ),
  //           content: Text(
  //             AppString.pleaseUpdateAppToContinue.t(context),
  //             style: Theme.of(context).textTheme.titleSmall!.copyWith(
  //                 fontSize: 14
  //             ),
  //           ),
  //           actions: <Widget>[
  //             TextButton(
  //               child: Text(
  //                   'Exit',
  //                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                       fontSize: 15,
  //                       color: Colors.red
  //                   )
  //               ),
  //               onPressed: () {
  //                 exit(0);
  //               },
  //             ),
  //             TextButton(
  //               child: Text(
  //                 AppString.updateNow.t(context),
  //                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                     fontSize: 15,
  //                     color: Theme.of(context).primaryColor
  //                 ),
  //               ),
  //               onPressed: () {
  //                 if(isIos){
  //                   try{
  //                     StoreRedirect.redirect(iOSAppId: '');
  //                   }catch(e){
  //                     Navigator.of(context).pop();
  //                   }
  //                 }else{
  //                   StoreRedirect.redirect(androidAppId: 'com.app.fleet_flutter');
  //                 }
  //               },
  //             )
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  static Future locationPermissionDialog(){
    return showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: Text('Location Permission',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 18
              )
          ),
          content: Text(
              'Please allow location permission from app settings to continue',
              maxLines: 4,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14
              )
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 15,
                      color: AppColor.errorBorderColor
                  )),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                  'Open Settings',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 15,
                      color: AppColor.appPrimaryColor
                  )
              ),
              onPressed: () async{
                try{
                  // await openAppSettings();
                  Navigator.of(context).pop(true);
                }catch(e){
                  printLog("locationPermissionDialog Error -> $e");
                }
              },
            )
          ],
        );
      },
    );
  }

  static dateTimeFormatter(DateTime date) {
    DateFormat dateFormatter = DateFormat("dd/MMMM/yyyy HH:mm:ss");
    try {
      return dateFormatter.format((date).toLocal());
    } catch (e) {
      return "";
    }
  }
  static timeFormatter(String date) {
    DateFormat dateFormatter = DateFormat("hh:mm a");
    try {
      return dateFormatter.format((DateTime.tryParse(date) ?? DateTime.now()).toLocal());
    } catch (e) {
      return "";
    }
  }
  static dateFormatter(String value) {
    //String datePattern = "MM/dd/yyyy";

    //DateTime birthDate = DateFormat(datePattern).parse(value);
    DateFormat format =  DateFormat("MMMM dd, yyyy");

    try {
      final reverse = value.split("/").reversed.toList();
      String temp = reverse.last;
      reverse[reverse.length-1] = reverse[reverse.length-2];
      reverse[reverse.length-2] = temp;
      return format.format((DateTime.tryParse(reverse.join("-")) ?? DateTime.now()).toLocal());
    } catch (e) {
      return "";
    }
  }
  static String? validateField(BuildContext context,dynamic value,String type) {
    if (value == null || value.isEmpty) {
      return "$type is empty";
    }

    return null;
  }


  static String? validateName(BuildContext context,dynamic value) {
    if (value == null || value.isEmpty) {
      return "Name is empty";
    }
    // if (value.length < 3 ) {
    //   return AppString.registerNameLength;
    // }
    // RegExp regExpDD = RegExp(
    //   r"^[0-9]*$",
    //   caseSensitive: false,
    // );
    // if(regExpDD.hasMatch(value)){
    //   //todo arabic
    //   return AppString.alphaCharacter;
    // }
    return null;
  }
  static String? validatePassword(BuildContext context,dynamic value) {
    if (value == null || value.isEmpty) {
      return "Password is Empty";
    }

    if (value.length > 20 ) {
      return "Password must be less than 20 characters";

    }
    return null;
  }
  static String? validateConfirmPassword(BuildContext context,dynamic value,String password) {
    if (value == null || value.isEmpty) {
      return AppString.emptyField;
    }
    if(value!=password){
      return AppString.registerPasswordMatch;
    }

    return null;
  }

  static String? validatePhoneNumber(BuildContext context, dynamic value) {
    if (value == null || value.isEmpty) {
      return "Phone Number is Empty";
    }

    // Regex for UAE phone number (assuming +971 country code and 9 digits)
    final RegExp uaePhoneRegex = RegExp(r'^\+971[0-9]{9}$');

    // Regex for Pakistan phone number (assuming +92 country code and 10 digits)
    final RegExp pakistanPhoneRegex = RegExp(r'^\+92[0-9]{10}$');

    // Regex for Saudi Arabia phone number (assuming +966 country code and 9 digits)
    final RegExp saudiPhoneRegex = RegExp(r'^\+966[0-9]{9}$');

    if (uaePhoneRegex.hasMatch(value)) {
      return null; // Valid UAE phone number
    } else if (pakistanPhoneRegex.hasMatch(value)) {
      return null; // Valid Pakistan phone number
    } else if (saudiPhoneRegex.hasMatch(value)) {
      return null; // Valid Saudi Arabia phone number
    } else {
      return "Expected format: +971XXXXXXXXX for UAE, +92XXXXXXXXXX for Pakistan, +966XXXXXXXXX for Saudi Arabia";
    }
  }


  static String? validateNationalID(BuildContext context, dynamic value) {
    if (value == null || value.isEmpty) {
      return "National ID is empty";
    }

    // Regex for UAE National ID (15 digits pattern)
    final RegExp uaeIDRegex = RegExp(r'^\d{3}-\d{4}-\d{7}-\d{1}$');

    // Regex for Pakistani National ID (13 digits pattern, typically separated by hyphens)
    final RegExp pakistanIDRegex = RegExp(r'^\d{5}-\d{7}-\d{1}$');

    // Regex for Saudi Arabian National ID (10 digits pattern)
    final RegExp saudiArabiaIDRegex = RegExp(r'^\d{10}$');

    if (uaeIDRegex.hasMatch(value)) {
      return null; // Valid UAE National ID
    } else if (pakistanIDRegex.hasMatch(value)) {
      return null; // Valid Pakistani National ID
    } else if (saudiArabiaIDRegex.hasMatch(value)) {
      return null; // Valid Saudi Arabian National ID
    } else {
      // Suggest correct format based on the length of the input
      // if (value.length == 17 && value.contains('-')) {
      //   return "Invalid UAE National ID. Correct format: XXX-XXXX-XXXXXXX-X";
      // } else if (value.length == 15 || value.contains('-')) {
      //   return "Invalid Pakistani National ID. Correct format: XXXXX-XXXXXXX-X";
      // } else if (value.length == 10 && !value.contains('-')) {
      //   return "Invalid Saudi Arabian National ID. Correct format: XXXXXXXXXX";
      // } else {
      //   return "Invalid National ID. Ensure the ID matches the correct format.";
      // }
    }
    return null;
  }

  static String? validateEmail(BuildContext context,dynamic value) {
    if (value == null || value.isEmpty) {
      return "Email is empty";
    }
    if(!RegExp(
        r"^((?!\.)[\w_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$")
        .hasMatch(value)){
      return "Invalid email inserted";
    }

    return null;
  }
  static String? validationDate(BuildContext context,dynamic value) {
    if (value == null || value.isEmpty) {
      return AppString.emptyField;
    }
    if(!_isAdult(value)){
      return AppString.registerDoB;
    }
    return null;
  }
  static bool _isAdult(String value) {
    String datePattern = "MM/dd/yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(value);
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
    int monthDiff = today.month - birthDate.month;
    int dayDiff = today.day - birthDate.day;

    return yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0;
  }
  static String? validateReferralCode(BuildContext context,dynamic value) {
    // if (value == null || value.isEmpty) {
    //   return 'You cannot leave this field blank.';
    // }
    RegExp couponExp = RegExp(r'^[A-Z]{3}-[A-Z a-z 0-9]{7}$', caseSensitive: false);

    if(!value.isEmpty){
      if(!couponExp.hasMatch(value)){
        return "Not found";
      }
    }
    return null;
  }
  static String? validateGender(BuildContext context,dynamic value) {
    if (value == null) {
      return AppString.emptyField;
    }
    return null;
  }
  static String? validateHowDidYouHearAboutUs(BuildContext context,dynamic value) {
    if (value == null || value.isEmpty) {
      return AppString.emptyField;
    }
    return null;
  }
  static String? validateLanguage(BuildContext context,dynamic value) {
    if (value == null) {
      return AppString.emptyField;
    }
    return null;
  }
  static String? validateSubject(BuildContext context,dynamic value) {
    if (value == null||value.isEmpty) {
      return AppString.emptyField;
    }
    if (value.length > 120 ) {
      return AppString.ConatctMaxSubject;
    }
    return null;
  }
  static String? validateMessage(BuildContext context,dynamic value) {
    if (value == null||value.isEmpty) {
      return AppString.emptyField;
    }
    if (value.length > 150 ) {
      return AppString.ConatctMaxMessage;
    }
    return null;
  }

  static Future<String?> datePicker(BuildContext context, {required DateTime currentDate})async{
    DateTime? date = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: currentDate.subtract(const Duration(days: 6575)),
      firstDate: DateTime(1800),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      lastDate: currentDate.subtract(const Duration(days: 6575)),
    );
    if(date != null){
      return DateFormat('dd MMM yyyy').format(date);
    }
    return null;
  }

  // static Future<DateTime?> showDateTimePicker(BuildContext context, {required DateTime currentDate})async{
  //   DateTime? date = await showOmniDateTimePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: currentDate.subtract(const Duration(days: 3650)),
  //       lastDate: currentDate.add(const Duration(days: 3650)),
  //       is24HourMode: true,
  //       isShowSeconds: false,
  //       minutesInterval: 1,
  //       secondsInterval: 1,
  //       borderRadius: const BorderRadius.all(Radius.circular(16)),
  //       constraints: const BoxConstraints(
  //         maxWidth: 350,
  //         maxHeight: 650,
  //       ),
  //       transitionBuilder: (context, anim1, anim2, child) {
  //         return FadeTransition(
  //           opacity: anim1.drive(
  //             Tween(
  //               begin: 0,
  //               end: 1,
  //             ),
  //           ),
  //           child: child,
  //         );
  //       },
  //       transitionDuration: const Duration(milliseconds: 200),
  //       barrierDismissible: true,
  //       selectableDayPredicate: (dateTime) {
  //         return true;
  //         // Disable 25th Feb 2023
  //         if (dateTime == DateTime(2023, 2, 25)) {
  //           return false;
  //         } else {
  //           return true;
  //         }
  //       },
  //       theme: Theme.of(context).copyWith(
  //
  //       )
  //   );
  //   if(date != null){
  //     return date;
  //   }
  //   return null;
  // }

  // static showCustomDialog(BuildContext context,{String? icon, required String title, required String message, required String buttonText, Function? onTap}) async {
  //   return await showGeneralDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     barrierLabel: 'check_invite',
  //     transitionDuration: const Duration(milliseconds: 200),
  //     pageBuilder: (_, __, ___) {
  //       return PopScope(
  //         canPop: false,
  //         child: Center(
  //           child: Wrap(
  //             children: [
  //               Container(
  //                 margin: const EdgeInsets.symmetric(horizontal: AppUtility.horizontalPadding),
  //                 padding: const EdgeInsets.symmetric(horizontal: AppUtility.horizontalPadding, vertical: AppUtility.verticalPadding),
  //                 width: double.infinity,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(28),
  //                   color: Theme.of(context).colorScheme.secondary,
  //                 ),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     const Gap(20),
  //                     if(icon != null)
  //                       ...[
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             SvgPicture.asset(
  //                                 icon,
  //                                 height: 35,
  //                                 fit: BoxFit.fitWidth,
  //                                 semanticsLabel: "icon"
  //                             )
  //                           ],
  //                         ),
  //                         const Gap(15),
  //                       ],
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                       child: Text(
  //                         title,
  //                         maxLines: 10,
  //                         textAlign: TextAlign.left,
  //                         style: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                             fontSize: 16
  //                         ),
  //                       ),
  //                     ),
  //                     const Gap(15),
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                       child: Text(
  //                         message,
  //                         maxLines: 10,
  //                         textAlign: TextAlign.left,
  //                         style: Theme.of(context).textTheme.titleMedium!.copyWith(
  //                             fontSize: 13
  //                         ),
  //                       ),
  //                     ),
  //                     const Gap(25),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         MyTextButton(
  //                           height: AppUtility.defaultButtonHeight - 6,
  //                           width: 80,
  //                           text: buttonText,
  //                           textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                               color: AppColor.white,
  //                               fontSize: 16
  //                           ),
  //                           onTap: (){
  //                             Navigator.pop(context);
  //                             if(onTap != null){
  //                               onTap();
  //                             }
  //                           },
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  static showTransparentDialog(BuildContext context,{required String message}) async {
    return await showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Wrap(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 34),
                padding: const EdgeInsets.only(top: 24),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(message,
                        //style: TextStyle(color: AppColor.textBlueColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("cancel")),
                        TextButton(
                            onPressed: () async {
                              Future.microtask(() => Navigator.popAndPushNamed(context, RouteStrings.loginScreen));
                              // Future.microtask(() =>
                              //     Navigator.pushAndRemoveUntil(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //             const LoginView()),
                              //             (route) => route.isCurrent));
                            },
                            child: const Text(AppString.ok)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  static Future<void> launchUrlExternal(Uri url) async {
    /*if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $Uri');
    }*/
  }

  static String parseHtmlString(String htmlString) {
    /*final document = parse(htmlString);
    if (document.body?.text != null) {
      return parse(document.body!.text).documentElement!.text;
    }*/

    return "";
  }


}

Future<bool> checkInternetConnection() async{
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      if(kDebugMode){
        print('connected');
      }
      return true;
    }
  } on SocketException catch (_) {
    if(kDebugMode){
      print('not connected');
    }
    return false;
  }
  return false;
}



// class RatingBuilderWidget extends StatelessWidget {
//   const RatingBuilderWidget({
//     super.key,
//     required this.rating,
//     required  this.ratingFunc,
//     this.iconSize,
//   });
//
//   final double rating;
//   final double? iconSize;
//   final void Function(double) ratingFunc;
//
//   @override
//   Widget build(BuildContext context) {
//     return RatingBar.builder(
//
//
//         initialRating: rating??0.0,
//         minRating: 1,
//         direction: Axis.horizontal,
//         allowHalfRating: true,
//         itemCount: 5,
//         itemPadding: EdgeInsets.zero,
//         itemSize:iconSize?? 12,
//         maxRating: 5,
//         itemBuilder: (context, _) => Icon(
//
//           Icons.star,
//           size: 2,
//           color: AppColor.ratingColor,
//         ),
//         onRatingUpdate: ratingFunc
//     );
//   }
// }

