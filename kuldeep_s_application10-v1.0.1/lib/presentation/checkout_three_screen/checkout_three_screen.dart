import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle.dart';
import 'package:kuldeep_s_application10/widgets/custom_icon_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'models/checkout_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/checkout_three_bloc.dart';

class CheckoutThreeScreen extends StatelessWidget {
  CheckoutThreeScreen({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  static Widget builder(BuildContext context) {
    return BlocProvider<CheckoutThreeBloc>(
      create: (context) => CheckoutThreeBloc(CheckoutThreeState(
        checkoutThreeModelObj: CheckoutThreeModel(),
      ))
        ..add(CheckoutThreeInitialEvent()),
      child: CheckoutThreeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutThreeBloc, CheckoutThreeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 18.v),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 16.v,
                    ),
                    decoration: AppDecoration.fillWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_contact_information".tr,
                          style: CustomTextStyles.titleSmallGray90002,
                        ),
                        SizedBox(height: 16.v),
                        Padding(
                          padding: EdgeInsets.only(right: 9.h),
                          child: Row(
                            children: [
                              CustomIconButton(
                                height: 40.adaptSize,
                                width: 40.adaptSize,
                                padding: EdgeInsets.all(10.h),
                                decoration: IconButtonStyleHelper.fillGray,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgUserGray90002,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "msg_rumenhussen_gmail_com".tr,
                                      style:
                                          CustomTextStyles.bodyMediumGray90002,
                                    ),
                                    SizedBox(height: 2.v),
                                    Text(
                                      "lbl_email".tr,
                                      style: CustomTextStyles.bodySmallGray600,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              CustomImageView(
                                imagePath: ImageConstant.imgEditIcon,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.symmetric(vertical: 10.v),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.v),
                        Padding(
                          padding: EdgeInsets.only(right: 9.h),
                          child: Row(
                            children: [
                              CustomIconButton(
                                height: 40.adaptSize,
                                width: 40.adaptSize,
                                padding: EdgeInsets.all(10.h),
                                decoration: IconButtonStyleHelper.fillGray,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgFrame,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "msg_88_692_764_269".tr,
                                      style:
                                          CustomTextStyles.bodyMediumGray90002,
                                    ),
                                    SizedBox(height: 3.v),
                                    Text(
                                      "lbl_phone".tr,
                                      style: CustomTextStyles.bodySmallGray600,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              CustomImageView(
                                imagePath: ImageConstant.imgEditIcon,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.symmetric(vertical: 10.v),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.v),
                        Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_address".tr,
                                    style: CustomTextStyles.titleSmallGray90002,
                                  ),
                                  SizedBox(height: 13.v),
                                  Text(
                                    "msg_newahall_st_36".tr,
                                    style: CustomTextStyles.bodySmallGray600,
                                  ),
                                ],
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowDownGray600,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.only(top: 27.v),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.v),
                        _buildMap(context),
                        SizedBox(height: 13.v),
                        Text(
                          "lbl_payment_method".tr,
                          style: CustomTextStyles.titleSmallGray90002,
                        ),
                        SizedBox(height: 11.v),
                        Padding(
                          padding: EdgeInsets.only(right: 4.h),
                          child: Row(
                            children: [
                              CustomIconButton(
                                height: 40.adaptSize,
                                width: 40.adaptSize,
                                padding: EdgeInsets.all(10.h),
                                decoration: IconButtonStyleHelper.fillGray,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgUserIndigo80001,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 12.h,
                                  top: 2.v,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "lbl_paypal_card".tr,
                                      style: CustomTextStyles
                                          .titleSmallWorkSansGray90002,
                                    ),
                                    SizedBox(height: 3.v),
                                    SizedBox(
                                      width: 101.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant.img,
                                            height: 3.v,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 6.v),
                                          ),
                                          Text(
                                            "lbl_0696_4629".tr,
                                            style: CustomTextStyles
                                                .bodySmallGray600,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowDownGray600,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.symmetric(vertical: 10.v),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 13.v),
                  _buildSubtotal(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgAppsCircle,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 6.v,
          bottom: 6.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "lbl_checkout".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildMap(BuildContext context) {
    return SizedBox(
      height: 101.v,
      width: 295.h,
      child: GoogleMap(
        //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            37.43296265331129,
            -122.08832357078792,
          ),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildSubtotal(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 23.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 7.h),
            child: _buildFrame(
              context,
              totalCost: "lbl_subtotal".tr,
              price: "lbl_1250_00".tr,
            ),
          ),
          SizedBox(height: 16.v),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: Text(
                    "lbl_shopping".tr,
                    style: CustomTextStyles.titleMediumGray600,
                  ),
                ),
                Text(
                  "lbl_40_90".tr,
                  style: CustomTextStyles.titleMediumGray90002,
                ),
              ],
            ),
          ),
          SizedBox(height: 23.v),
          Divider(
            color: appTheme.gray200,
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(right: 7.h),
            child: _buildFrame(
              context,
              totalCost: "lbl_total_cost".tr,
              price: "lbl_1690_99".tr,
            ),
          ),
          SizedBox(height: 22.v),
          CustomElevatedButton(
            text: "lbl_payment".tr,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String totalCost,
    required String price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 1.v,
            bottom: 4.v,
          ),
          child: Text(
            totalCost,
            style: CustomTextStyles.titleMediumGray90002_1.copyWith(
              color: appTheme.gray90002,
            ),
          ),
        ),
        Text(
          price,
          style: CustomTextStyles.titleLargeGray90002.copyWith(
            color: appTheme.gray90002,
          ),
        ),
      ],
    );
  }
}
