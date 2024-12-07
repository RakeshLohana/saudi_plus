import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saudi_plus/core/constants/route_strings.dart';
import 'package:saudi_plus/core/services/shared_preferences.dart';
import 'package:saudi_plus/core/utils/app_strings.dart';
import 'package:saudi_plus/core/utils/app_utility.dart';
import 'package:saudi_plus/core/utils/routes_generator.dart';
import 'package:saudi_plus/features/auth/domain/repository/auth_repository.dart';
import 'package:saudi_plus/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:saudi_plus/features/dashboard/presentation/bloc/main_dashboard_bloc.dart';
import 'package:saudi_plus/features/languages/bloc/language_bloc.dart';
import 'package:saudi_plus/features/languages/bloc/language_event.dart';
import 'package:saudi_plus/features/languages/bloc/language_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_plus/dependency_injection.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  final savedLocale = await PreferencesService.getLanguage();
  runApp(

      MyApp(savedLocale: savedLocale));
}

class MyApp extends StatelessWidget {
  final _authRepository = sl<AuthRepository>();

  final Locale? savedLocale;

   MyApp({super.key, this.savedLocale});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MainDashboardBloc(),),
          BlocProvider(create: (context) => AuthBloc(),),
          BlocProvider(create: (context) =>
          LanguageBloc()..add(ChangeLanguage(savedLocale??const Locale("en"))),)
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            final locale=state is LanguageChanged ?state.locale:savedLocale;
            return MaterialApp(
                debugShowCheckedModeBanner: false,
              title: AppString.appName,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                builder: (context, child) =>
                ResponsiveBreakpoints.builder(child: child!, breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ]),
                navigatorKey: AppUtility.navigatorKey,
                onGenerateRoute: RouteGenerator.generateRoute,
                initialRoute: RouteStrings.splash,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
            );
          },
        ),
      ),
    );
  }
}


