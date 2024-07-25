part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}
class DashboardInitial extends DashboardState {}
class DashboardFetchingState extends DashboardState {}
class DashboardFetchingFailureState extends DashboardState {
final String message;
  DashboardFetchingFailureState(this.message);
}
class DashboardFetchingSuccessState extends DashboardState {
  final List<DashboardModel> response;
    DashboardFetchingSuccessState(this.response);


}
class DashboardPostingState extends DashboardState {}
class DashboardPostingFailureState extends DashboardState {
final String message;
  DashboardPostingFailureState(this.message);
}

class DashboardPostingSuccessState extends DashboardState {
  final List<DashboardModel> response;
    DashboardPostingSuccessState(this.response);

}

