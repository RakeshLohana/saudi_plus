import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_plus/core/services/shared_preferences.dart';
import 'package:saudi_plus/features/dashboard/presentation/bloc/main_dashboard_bloc.dart';
import 'package:saudi_plus/features/languages/bloc/language_bloc.dart';
import 'package:saudi_plus/features/languages/bloc/language_event.dart';
import 'package:saudi_plus/features/languages/bloc/language_state.dart';
import 'package:saudi_plus/l10n/app_local.dart';

import 'features/dashboard/presentation/pages/main_dashboard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedLocale = await PreferencesService.getLanguage();
  runApp(

      MyApp(savedLocale: savedLocale));
}

class MyApp extends StatelessWidget {
  final Locale? savedLocale;

  const MyApp({super.key, this.savedLocale});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainDashboardBloc(),),
        BlocProvider(create: (context) =>
        LanguageBloc()
          ..add(ChangeLanguage(savedLocale??const Locale("en"))),)
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          final locale=state is LanguageChanged ?state.locale:savedLocale;
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Saudi Plus',
              supportedLocales: AppLocalizations.supportedLocales,
              locale: locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,

              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: MainDashboardScreen()
          );
        },
      ),
    );
  }
}


