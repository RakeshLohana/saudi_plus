part of 'main_dashboard_bloc.dart';

@immutable
sealed class MainDashboardState {}

final class MainDashboardInitial extends MainDashboardState {}


class TabChangedState extends MainDashboardState {
  final int currentIndex;

  TabChangedState(this.currentIndex);
}

class LanguageColorChangeState extends MainDashboardState {
  final bool selectedColor;

  LanguageColorChangeState(this.selectedColor);
}