import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'account_page_event.dart';
part 'account_page_state.dart';

class AccountPageBloc extends Bloc<AccountPageEvent, AccountPageState> {
  AccountPageBloc() : super(AccountPageInitial()) {
    on<AccountPageLogOutEvent>(accountPageLogOutEvent);
    on<AccountPageLogoutConfirmedEvent>(accountPageLogoutConfirmedEvent);
    on<AccountPageNavigateToMyOrdersPageEvent>(
        accountPageNavigateToMyOrdersPageEvent);
    on<AccountPageNavigateToWishListPageEvent>(
        accountPageNavigateToWishListPageEvent);
  }

  FutureOr<void> accountPageLogOutEvent(
      AccountPageLogOutEvent event, Emitter<AccountPageState> emit) {
    emit(AccountPageLogOutConfirmationActionState());
  }

  FutureOr<void> accountPageLogoutConfirmedEvent(
      AccountPageLogoutConfirmedEvent event,
      Emitter<AccountPageState> emit) async {
    emit(AccountPageLoadingState());
    await event.prefs.remove("token");
    await Future.delayed(const Duration(seconds: 2));
    emit(LogoutSuccessActionState());
  }

  FutureOr<void> accountPageNavigateToMyOrdersPageEvent(
      AccountPageNavigateToMyOrdersPageEvent event,
      Emitter<AccountPageState> emit) {
    emit(NavigateToMyordersPageActionState());
  }

  FutureOr<void> accountPageNavigateToWishListPageEvent(
      AccountPageNavigateToWishListPageEvent event,
      Emitter<AccountPageState> emit) {
    emit(NavigateToWishListPageActionState());
  }
}
