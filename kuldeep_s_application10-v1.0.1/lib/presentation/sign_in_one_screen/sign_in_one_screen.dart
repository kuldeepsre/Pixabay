import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton.dart';import 'package:kuldeep_s_application10/core/utils/validation_functions.dart';import 'package:kuldeep_s_application10/widgets/custom_text_form_field.dart';import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';import 'models/sign_in_one_model.dart';import 'package:flutter/material.dart';import 'package:kuldeep_s_application10/core/app_export.dart';import 'bloc/sign_in_one_bloc.dart';import 'package:kuldeep_s_application10/domain/googleauth/google_auth_helper.dart';
// ignore_for_file: must_be_immutable
class SignInOneScreen extends StatelessWidget {SignInOneScreen({Key? key}) : super(key: key);

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

static Widget builder(BuildContext context) { return BlocProvider<SignInOneBloc>(create: (context) => SignInOneBloc(SignInOneState(signInOneModelObj: SignInOneModel()))..add(SignInOneInitialEvent()), child: SignInOneScreen()); } 
@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: SizedBox(width: SizeUtils.width, child: SingleChildScrollView(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), child: SizedBox(height: MediaQuery.of(context).size.height, child: Form(key: _formKey, child: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 28.v), child: Column(children: [Text("lbl_hello_again".tr, style: CustomTextStyles.headlineMediumGray90002), SizedBox(height: 2.v), Text("msg_welcome_back_you_ve".tr, style: theme.textTheme.bodyLarge), SizedBox(height: 50.v), Align(alignment: Alignment.centerLeft, child: Text("lbl_email_address".tr, style: CustomTextStyles.titleMediumGray90002_1)), SizedBox(height: 11.v), _buildEmail(context), SizedBox(height: 29.v), Align(alignment: Alignment.centerLeft, child: Text("lbl_password".tr, style: CustomTextStyles.titleMediumGray90002_1)), SizedBox(height: 11.v), _buildPassword(context), SizedBox(height: 13.v), Align(alignment: Alignment.centerRight, child: Text("msg_recovery_password".tr, style: CustomTextStyles.bodyMedium13)), SizedBox(height: 27.v), _buildSignIn(context), SizedBox(height: 30.v), _buildSignInWithGoogle(context), Spacer(), SizedBox(height: 21.v), Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(padding: EdgeInsets.only(bottom: 1.v), child: Text("msg_don_t_have_an_account".tr, style: CustomTextStyles.bodySmallGray600)), Padding(padding: EdgeInsets.only(left: 2.h), child: Text("msg_sign_up_for_free".tr, style: theme.textTheme.labelLarge))])])))))))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: double.maxFinite, leading: AppbarLeadingIconbutton(imagePath: ImageConstant.imgAppsCircle, margin: EdgeInsets.fromLTRB(20.h, 6.v, 311.h, 6.v))); } 
/// Section Widget
Widget _buildEmail(BuildContext context) { return BlocSelector<SignInOneBloc, SignInOneState, TextEditingController?>(selector: (state) => state.emailController, builder: (context, emailController) {return CustomTextFormField(controller: emailController, hintText: "msg_alissonbecker_gmail_com".tr, textInputType: TextInputType.emailAddress, validator: (value) {if (value == null || (!isValidEmail(value, isRequired: true))) {return "err_msg_please_enter_valid_email".tr;} return null;});}); } 
/// Section Widget
Widget _buildPassword(BuildContext context) { return BlocBuilder<SignInOneBloc, SignInOneState>(builder: (context, state) {return CustomTextFormField(controller: state.passwordController, textInputAction: TextInputAction.done, suffix: InkWell(onTap: () {context.read<SignInOneBloc>().add(ChangePasswordVisibilityEvent(value: !state.isShowPassword));}, child: Container(margin: EdgeInsets.fromLTRB(30.h, 12.v, 14.h, 12.v), child: CustomImageView(imagePath: ImageConstant.imgEye, height: 24.adaptSize, width: 24.adaptSize))), suffixConstraints: BoxConstraints(maxHeight: 48.v), obscureText: state.isShowPassword);}); } 
/// Section Widget
Widget _buildSignIn(BuildContext context) { return CustomElevatedButton(text: "lbl_sign_in".tr); } 
/// Section Widget
Widget _buildSignInWithGoogle(BuildContext context) { return CustomElevatedButton(text: "msg_sign_in_with_google".tr, leftIcon: Container(margin: EdgeInsets.only(right: 8.h), child: CustomImageView(imagePath: ImageConstant.imgGoogle, height: 24.adaptSize, width: 24.adaptSize)), buttonStyle: CustomButtonStyles.fillWhiteA, buttonTextStyle: CustomTextStyles.titleMediumGray90002, onPressed: () {onTapSignInWithGoogle(context);}); } 
onTapSignInWithGoogle(BuildContext context) async  {         await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
          if(googleUser!=null){
            //TODO Actions to be performed after signin
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('user data is empty')));
          }
        }).catchError((onError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(onError.toString())));
        });
         } 
 }
