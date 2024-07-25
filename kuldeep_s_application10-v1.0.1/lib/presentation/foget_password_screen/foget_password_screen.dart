import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:kuldeep_s_application10/core/utils/validation_functions.dart';
import 'package:kuldeep_s_application10/widgets/custom_text_form_field.dart';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'models/foget_password_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/foget_password_bloc.dart';

class FogetPasswordScreen extends StatelessWidget {
  FogetPasswordScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<FogetPasswordBloc>(
      create: (context) => FogetPasswordBloc(FogetPasswordState(
        fogetPasswordModelObj: FogetPasswordModel(),
      ))
        ..add(FogetPasswordInitialEvent()),
      child: FogetPasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90001,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 30.v,
                ),
                child: Column(
                  children: [
                    Text(
                      "msg_recovery_password".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 5.v),
                    Container(
                      width: 255.h,
                      margin: EdgeInsets.only(
                        left: 40.h,
                        right: 39.h,
                      ),
                      child: Text(
                        "msg_please_enter_your".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                    SizedBox(height: 47.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_email_address".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 11.v),
                    BlocSelector<FogetPasswordBloc, FogetPasswordState,
                        TextEditingController?>(
                      selector: (state) => state.emailController,
                      builder: (context, emailController) {
                        return CustomTextFormField(
                          controller: emailController,
                          hintText: "msg_alissonbecker_gmail_com".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_email".tr;
                            }
                            return null;
                          },
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray900,
                        );
                      },
                    ),
                    SizedBox(height: 40.v),
                    CustomElevatedButton(
                      text: "lbl_continue".tr,
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingIconbuttonTwo(
        imagePath: ImageConstant.imgAppsCircleWhiteA700,
        margin: EdgeInsets.fromLTRB(20.h, 6.v, 311.h, 6.v),
      ),
    );
  }
}
