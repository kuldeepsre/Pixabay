import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/login_model.dart';
import '../../../domain/controller/login_controller.dart';
part 'login_event.dart';
part 'login_state.dart';
@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
   ILoginController controller;


   LoginBloc(this.controller) : super(LoginInitial()) {
     on<LoginFetchEvent>(_onLoginFetchEvent);
     on<LoginPostEvent>(_onLoginPostEvent);

   }
   void _onLoginFetchEvent(LoginFetchEvent event, Emitter<LoginState> emit) async {
     try {
       emit(LoginFetchingState());
       final response = await controller.getLogin();
       if (response.success) {
         emit(LoginFetchingSuccessState(response.response));
       } else {
         emit(LoginFetchingFailureState(response.message));
       }
     } catch (error) {
       // Handle error appropriately
       print('Error in LoginFetchEvent: $error');
       emit(LoginFetchingFailureState('An error occurred'));
     }
   }
   void _onLoginPostEvent(LoginPostEvent event, Emitter<LoginState> emit) async {
     try {
       emit(LodginPostingState());
       final response = await controller.postLogin(event.body);
       if (response.success) {
         emit(LoginPostingSuccessState(response.response));
       } else {
         emit(LoginPostingFailureState(response.message));
       }
     } catch (error) {
       // Handle error appropriately
       print('Error in LoginFetchEvent: $error');
       emit(LoginFetchingFailureState('An error occurred'));
     }
   }

}
