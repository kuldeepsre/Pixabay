import 'models/splash_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/splash_one_bloc.dart';

class SplashOneScreen extends StatelessWidget {
  const SplashOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashOneBloc>(
      create: (context) => SplashOneBloc(SplashOneState(
        splashOneModelObj: SplashOneModel(),
      ))
        ..add(SplashOneInitialEvent()),
      child: SplashOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashOneBloc, SplashOneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5.v),
                  Text(
                    "lbl_nikeyboots2".tr.toUpperCase(),
                    style: CustomTextStyles.headlineMediumAcme,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
