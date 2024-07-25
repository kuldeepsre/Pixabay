import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/presentation/authentication/bloc/auth_page_bloc.dart';
import 'package:fluxestore/presentation/landing_page/landing_page.dart';
import 'package:fluxestore/presentation/pages/login_page.dart';
import 'package:fluxestore/presentation/pages/sign_up_page.dart';
import 'package:fluxestore/utils/dialogs/loading_dialog.dart';
import 'package:toastification/toastification.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final AuthPageBloc authPagebloc = AuthPageBloc();
  CloseDialog? _closeDialogHandle;
  @override
  void initState() {
    authPagebloc.add(AuthPageInitailEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthPageBloc, AuthPageState>(
      bloc: authPagebloc,
      listenWhen: (previous, current) => current is AuthPageActionState,
      buildWhen: (previous, current) => current is! AuthPageActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case AuthPageInvalidPasswordActionState:
            toastification.show(
                context: context,
                title: const Text(
                    "Enter a valid password (at least 8 characters, containing at least one uppercase letter, one lowercase letter, one digit, and one special character)"),
                type: ToastificationType.error,
                style: ToastificationStyle.fillColored,
                animationDuration: const Duration(milliseconds: 600),
                autoCloseDuration: const Duration(milliseconds: 4500),
                showProgressBar: false,
                alignment: Alignment.topCenter);

          case ShowSnackBarActionState:
            final snackBarState = state as ShowSnackBarActionState;

            if (snackBarState.status == true) {
              toastification.show(
                  context: context,
                  title: Text(snackBarState.message),
                  type: ToastificationType.success,
                  style: ToastificationStyle.fillColored,
                  animationDuration: const Duration(milliseconds: 600),
                  autoCloseDuration: const Duration(milliseconds: 4500),
                  showProgressBar: false,
                  alignment: Alignment.bottomCenter);
            } else {
              toastification.show(
                  context: context,
                  title: Text(snackBarState.message),
                  type: ToastificationType.error,
                  style: ToastificationStyle.fillColored,
                  animationDuration: const Duration(milliseconds: 600),
                  autoCloseDuration: const Duration(milliseconds: 4500),
                  showProgressBar: false,
                  alignment: Alignment.bottomCenter);
            }

            break;
          case AuthenticationLoadingState:
            final currentState = state as AuthenticationLoadingState;
            final closeDialog = _closeDialogHandle;
            if (!currentState.isLoading && closeDialog != null) {
              closeDialog();
              _closeDialogHandle = null;
            } else if (currentState.isLoading && closeDialog == null) {
              _closeDialogHandle = showLoadingDialog(context: context);
            }
            break;
          case AuthenticationSuccesState:
            final successState = state as AuthenticationSuccesState;
            Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => LandingPage(
                        token: successState.token,
                      )),
              ModalRoute.withName('/'),
            );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ShowSignUpPageState:
            return SignUpPage(bloc: authPagebloc);
          case ShowLoginPagePageState:
            return LoginPage(bloc: authPagebloc);
        }
        return const SizedBox();
      },
    );
  }
}
