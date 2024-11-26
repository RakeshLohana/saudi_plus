import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_dashboard_event.dart';
part 'main_dashboard_state.dart';

class MainDashboardBloc extends Bloc<MainDashboardEvent, MainDashboardState> {
  MainDashboardBloc() : super(MainDashboardInitial()) {
    on<ChangeTab>((event, emit) {
      emit(TabChangedState(event.index));

    });

    on<LanguageColorChange>((event, emit) {
      emit(LanguageColorChangeState(event.selectedColor));

    });
  }
}
