import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_title.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kuldeep_s_application10/widgets/custom_icon_button.dart';
import 'package:kuldeep_s_application10/widgets/custom_text_form_field.dart';
import 'package:kuldeep_s_application10/core/utils/validation_functions.dart';
import 'models/profile_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/profile_one_bloc.dart';

class ProfileOneScreen extends StatelessWidget {
  ProfileOneScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileOneBloc>(
      create: (context) => ProfileOneBloc(ProfileOneState(
        profileOneModelObj: ProfileOneModel(),
      ))
        ..add(ProfileOneInitialEvent()),
      child: ProfileOneScreen(),
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
                  vertical: 18.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 100.v,
                        width: 90.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 90.adaptSize,
                                width: 90.adaptSize,
                                decoration: AppDecoration.fillBlue.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder45,
                                ),
                                child: CustomImageView(
                                  imagePath:
                                      ImageConstant.imgSobhanJoodiZg90x90,
                                  height: 90.adaptSize,
                                  width: 90.adaptSize,
                                  radius: BorderRadius.circular(
                                    45.h,
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            CustomIconButton(
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              padding: EdgeInsets.all(4.h),
                              decoration: IconButtonStyleHelper.fillPrimary,
                              alignment: Alignment.bottomCenter,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgHugeIconMultimedia,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 4.v),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "lbl_alisson_becker2".tr,
                        style: CustomTextStyles.titleLargeWhiteA700,
                      ),
                    ),
                    SizedBox(height: 32.v),
                    Text(
                      "lbl_full_name".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 11.v),
                    BlocSelector<ProfileOneBloc, ProfileOneState,
                        TextEditingController?>(
                      selector: (state) => state.fullNameController,
                      builder: (context, fullNameController) {
                        return CustomTextFormField(
                          controller: fullNameController,
                          hintText: "lbl_alosson_becker".tr,
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray900,
                        );
                      },
                    ),
                    SizedBox(height: 15.v),
                    Text(
                      "lbl_email_address".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 11.v),
                    BlocSelector<ProfileOneBloc, ProfileOneState,
                        TextEditingController?>(
                      selector: (state) => state.emailController,
                      builder: (context, emailController) {
                        return CustomTextFormField(
                          controller: emailController,
                          hintText: "msg_alossonbecker_gmail_com".tr,
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
                    SizedBox(height: 15.v),
                    Text(
                      "lbl_password".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 11.v),
                    BlocSelector<ProfileOneBloc, ProfileOneState,
                        TextEditingController?>(
                      selector: (state) => state.passwordController,
                      builder: (context, passwordController) {
                        return CustomTextFormField(
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray900,
                        );
                      },
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
      leadingWidth: 64.h,
      leading: AppbarLeadingIconbuttonTwo(
        imagePath: ImageConstant.imgAppsCircleWhiteA700,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 6.v,
          bottom: 6.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_profile".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgEditIconPrimary,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 16.v,
          ),
        ),
      ],
    );
  }
}
