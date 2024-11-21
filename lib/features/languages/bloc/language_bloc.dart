import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:saudi_plus/features/languages/bloc/language_event.dart';
import 'package:saudi_plus/features/languages/bloc/language_state.dart';


class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial(const Locale("en"))) {
    on<ChangeLanguage>((event, emit) {

      emit(LanguageChanged(event.locale));
    });
  }
}
