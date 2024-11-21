import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_plus/core/services/shared_preferences.dart';
import 'package:saudi_plus/features/languages/bloc/language_bloc.dart';
import 'package:saudi_plus/features/languages/bloc/language_event.dart';

class LanguageChoose{


  static void chooseLanguage(BuildContext context, String languageCode) async{
    final locale=Locale(languageCode);
    BlocProvider.of<LanguageBloc>(context).add(ChangeLanguage(locale));
    await PreferencesService.setLanguage(locale);

  }
}