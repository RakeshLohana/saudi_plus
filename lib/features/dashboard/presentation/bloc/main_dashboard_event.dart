part of 'main_dashboard_bloc.dart';

@immutable
sealed class MainDashboardEvent {}


class ChangeTab extends MainDashboardEvent {


  final int index;

  ChangeTab(this.index);
}
