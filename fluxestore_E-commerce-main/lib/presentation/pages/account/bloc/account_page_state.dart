part of 'account_page_bloc.dart';

@immutable
sealed class AccountPageState {}

final class AccountPageInitial extends AccountPageState {}

abstract class AccountPageActionState extends AccountPageState{}

class AccountPageLoadingState extends AccountPageActionState{}

class AccountPageLogOutConfirmationActionState extends AccountPageActionState{}

class LogoutSuccessActionState extends AccountPageActionState{}

class NavigateToMyordersPageActionState extends AccountPageActionState{}

class NavigateToWishListPageActionState extends AccountPageActionState{}