part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardFetchEvent extends DashboardEvent {}

class DashboardPostEvent extends DashboardEvent {}

