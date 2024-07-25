import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/sign_up.dart';
import '../../../domain/controller/signup_controller.dart';

part 'signup_event.dart';
part 'signup_state.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
 ISignupController controller;

  SignupBloc(this.controller) : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if(event is SignupFetchEvent){
        yield SignupFetchingState();
        final response = await controller.getSignup();
            if (response.success) {
               yield SignupFetchingSuccessState(response.response);
               return;
              }
        yield SignupFetchingFailureState(response.message);
    }
    else if (event is SignupPostEvent){
         yield SignupPostingState();
           final response = await controller.getSignup();
             if (response.success) {
                yield SignupPostingSuccessState(response.response);
                    return;
             }
         yield SignupPostingFailureState(response.message);
    }
  }
}
