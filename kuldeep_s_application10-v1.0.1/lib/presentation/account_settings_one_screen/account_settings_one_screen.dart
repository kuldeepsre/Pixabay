import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_title.dart';
import 'package:kuldeep_s_application10/widgets/custom_switch.dart';
import 'models/account_settings_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/account_settings_one_bloc.dart';

class AccountSettingsOneScreen extends StatelessWidget {
  const AccountSettingsOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountSettingsOneBloc>(
      create: (context) => AccountSettingsOneBloc(AccountSettingsOneState(
        accountSettingsOneModelObj: AccountSettingsOneModel(),
      ))
        ..add(AccountSettingsOneInitialEvent()),
      child: AccountSettingsOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90001,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 16.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_account".tr,
                style: CustomTextStyles.titleMedium18,
              ),
              SizedBox(height: 23.v),
              _buildShopping(
                context,
                shopping: ImageConstant.imgNotifications,
                shippingAddress: "msg_notification_setting".tr,
              ),
              SizedBox(height: 15.v),
              Divider(
                color: appTheme.gray900,
              ),
              SizedBox(height: 15.v),
              _buildShopping(
                context,
                shopping: ImageConstant.imgShopping,
                shippingAddress: "msg_shipping_address".tr,
              ),
              SizedBox(height: 15.v),
              Divider(
                color: appTheme.gray900,
              ),
              SizedBox(height: 15.v),
              _buildShopping(
                context,
                shopping: ImageConstant.imgPayment,
                shippingAddress: "lbl_payment_info".tr,
              ),
              SizedBox(height: 15.v),
              Divider(
                color: appTheme.gray900,
              ),
              SizedBox(height: 15.v),
              _buildShopping(
                context,
                shopping: ImageConstant.imgDeleteIcon,
                shippingAddress: "lbl_delete_account".tr,
              ),
              SizedBox(height: 16.v),
              Divider(
                color: appTheme.gray900,
              ),
              SizedBox(height: 39.v),
              Text(
                "lbl_app_settings".tr,
                style: CustomTextStyles.titleMedium18,
              ),
              SizedBox(height: 21.v),
              _buildEnebleFaceIDFor(context),
              SizedBox(height: 17.v),
              Divider(
                color: appTheme.gray900,
              ),
              SizedBox(height: 15.v),
              _buildEneblePushNotifications(context),
              SizedBox(height: 16.v),
              Divider(
                color: appTheme.gray900,
              ),
              SizedBox(height: 15.v),
              _buildEnebleLocation(context),
              SizedBox(height: 16.v),
              Divider(
                color: appTheme.gray900,
              ),
              SizedBox(height: 15.v),
              _buildDarkMode(context),
              SizedBox(height: 16.v),
              Divider(
                color: appTheme.gray900,
              ),
              SizedBox(height: 5.v),
            ],
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
        text: "msg_account_settings".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildEnebleFaceIDFor(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.v),
          child: Text(
            "msg_eneble_face_id_for".tr,
            style: CustomTextStyles.bodyLargeWhiteA700,
          ),
        ),
        BlocSelector<AccountSettingsOneBloc, AccountSettingsOneState, bool?>(
          selector: (state) => state.isSelectedSwitch,
          builder: (context, isSelectedSwitch) {
            return CustomSwitch(
              value: isSelectedSwitch,
              onChange: (value) {
                context
                    .read<AccountSettingsOneBloc>()
                    .add(ChangeSwitchEvent(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEneblePushNotifications(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.v),
          child: Text(
            "msg_eneble_push_notifications".tr,
            style: CustomTextStyles.bodyLargeWhiteA700,
          ),
        ),
        BlocSelector<AccountSettingsOneBloc, AccountSettingsOneState, bool?>(
          selector: (state) => state.isSelectedSwitch1,
          builder: (context, isSelectedSwitch1) {
            return CustomSwitch(
              value: isSelectedSwitch1,
              onChange: (value) {
                context
                    .read<AccountSettingsOneBloc>()
                    .add(ChangeSwitch1Event(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEnebleLocation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.v),
          child: Text(
            "msg_eneble_location".tr,
            style: CustomTextStyles.bodyLargeWhiteA700,
          ),
        ),
        BlocSelector<AccountSettingsOneBloc, AccountSettingsOneState, bool?>(
          selector: (state) => state.isSelectedSwitch2,
          builder: (context, isSelectedSwitch2) {
            return CustomSwitch(
              value: isSelectedSwitch2,
              onChange: (value) {
                context
                    .read<AccountSettingsOneBloc>()
                    .add(ChangeSwitch2Event(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildDarkMode(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.v),
          child: Text(
            "lbl_dark_mode".tr,
            style: CustomTextStyles.bodyLargeWhiteA700,
          ),
        ),
        BlocSelector<AccountSettingsOneBloc, AccountSettingsOneState, bool?>(
          selector: (state) => state.isSelectedSwitch3,
          builder: (context, isSelectedSwitch3) {
            return CustomSwitch(
              value: isSelectedSwitch3,
              onChange: (value) {
                context
                    .read<AccountSettingsOneBloc>()
                    .add(ChangeSwitch3Event(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildShopping(
    BuildContext context, {
    required String shopping,
    required String shippingAddress,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: shopping,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.h,
            top: 3.v,
          ),
          child: Text(
            shippingAddress,
            style: CustomTextStyles.bodyLargeWhiteA700.copyWith(
              color: appTheme.whiteA700,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgRightArrow,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ],
    );
  }
}
