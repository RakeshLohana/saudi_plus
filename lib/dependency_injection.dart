import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:saudi_plus/core/network/api_client.dart';
import 'package:saudi_plus/core/services/shared_preferences.dart';
import 'package:saudi_plus/core/utils/general.dart';
import 'package:saudi_plus/features/auth/domain/data/datasources/auth_data_source.dart';
import 'package:saudi_plus/features/auth/domain/data/respositories/auth_repository_impl.dart';
import 'package:saudi_plus/features/auth/domain/repository/auth_repository.dart';
import 'package:saudi_plus/l10n/app_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setup() async {
   final sharedPreferences = await SharedPreferences.getInstance();
   final Dio dio = Dio();
   final savedLocale = await PreferencesService.getLanguage();


   sl.registerLazySingleton(() => Dio());

   printLog("[setup] **** App Settings Applied ****");

   sl.registerLazySingleton(() => ApiClient(dio: dio,language: "ar"));

  // Auth
  sl.registerLazySingleton(() => AuthRemoteDataSource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()),
  );
}
