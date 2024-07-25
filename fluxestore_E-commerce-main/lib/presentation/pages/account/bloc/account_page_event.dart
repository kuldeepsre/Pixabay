part of 'account_page_bloc.dart';

@immutable
sealed class AccountPageEvent {}

class AccountPageLogOutEvent extends AccountPageEvent {}

class AccountPageNavigateToMyOrdersPageEvent extends AccountPageEvent {}

class AccountPageNavigateToWishListPageEvent extends AccountPageEvent {}

class AccountPageLogoutConfirmedEvent extends AccountPageEvent {
  final SharedPreferences prefs;

  AccountPageLogoutConfirmedEvent({required this.prefs});
}
