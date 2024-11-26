
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:saudi_plus/core/utils/app_strings.dart';



const double deliveryCharges= 10;

/// Logging config
const kLOG_TAG = "[${AppString.appName}]";
const kLOG_ENABLE = kDebugMode;

void printLog(dynamic data) {
  if (kLOG_ENABLE) {
    log("$kLOG_TAG ${data.toString()}");
  }
}