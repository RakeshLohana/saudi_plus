import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:saudi_plus/core/constants/route_strings.dart';
import 'package:saudi_plus/core/utils/app_utility.dart';
import 'package:saudi_plus/core/utils/general.dart';
import 'package:saudi_plus/dependency_injection.dart';
import 'package:saudi_plus/features/auth/domain/repository/auth_repository.dart';



class ServerException implements Exception {
  final DioException object;

  const ServerException({required this.object});
}

class CacheException implements Exception {
  const CacheException();
}

class ParsedException implements Exception {
  const ParsedException();
}

class UnauthorizedException implements Exception {
  const UnauthorizedException();
}

Future whenExceptionCatch(Exception e) async {
  printLog("whenExceptionCatch: ${e.toString()}");
  if (e is ServerException) {
    printLog("whenExceptionCatch -> ${e.object.response?.statusCode} ${e.object.type.name}");
    switch(e.object.type){
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        AppUtility.snackBar(message: 'No Internet Connection');
        return true;
      case DioExceptionType.badResponse:
        if(e.object.response!.statusCode == 401){
          if(e.object.response!.statusMessage == "token_expired"){
            AppUtility.snackBar(message: "Token expired, Please login again", seconds: 2);
            // await sl<AuthRepository>().logout();
            Navigator.pushNamedAndRemoveUntil(AppUtility.navigatorKey.currentContext!, RouteStrings.loginScreen, (route) => false);
            return false;
          }else{
            AppUtility.snackBar(message: "Unauthorized [401]", seconds: 2);
            return;
          }
        }
        if(e.object.response!.statusCode==403){
          AppUtility.snackBar(message: "Connection refused, Please contact admin [403]", seconds: 2);
          return false;
        }
        if(e.object.response!.statusCode==500){
          AppUtility.snackBar(message: "Operation refused, Server error [500]", seconds: 2);
          return false;
        }
        final error = e.object.response!.data as Map;
        final localError = error['error_description'];
        if(localError.toString() == "blocked"){
          //await sl<AuthenticationProvider>().accountDeactivated();
          return false;
        }

        if(localError.toString() == "Unauthenticated!!"){
          //await sl<AuthenticationProvider>().accountDeactivated();
          return false;
        }
        AppUtility.snackBar(message: localError.toString(), seconds: 1);
        return false;
    }
  }

  if (e is ParsedException) {
    printLog("ParsedException: $e");
  }
  if (e is FormatException) {
    printLog("FormatException: $e");
  }
  if (e is UnauthorizedException) {
    printLog("UnauthorizedException: $e");
  }
  return false;
}