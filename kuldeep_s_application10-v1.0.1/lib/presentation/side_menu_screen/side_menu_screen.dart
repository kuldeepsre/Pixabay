import 'models/side_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/side_menu_bloc.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SideMenuBloc>(
      create: (context) => SideMenuBloc(SideMenuState(
        sideMenuModelObj: SideMenuModel(),
      ))
        ..add(SideMenuInitialEvent()),
      child: SideMenuScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideMenuBloc, SideMenuState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray90002,
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 48.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      top: 5.v,
                      bottom: 23.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 64.adaptSize,
                          width: 64.adaptSize,
                          decoration: AppDecoration.fillBlue.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder32,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgSobhanJoodiZg,
                            height: 64.adaptSize,
                            width: 64.adaptSize,
                            radius: BorderRadius.circular(
                              32.h,
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        SizedBox(height: 24.v),
                        Text(
                          "lbl_hey".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        SizedBox(height: 6.v),
                        Text(
                          "lbl_alisson_becker2".tr,
                          style: theme.textTheme.headlineSmall,
                        ),
                        SizedBox(height: 49.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgLock,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: Text(
                                "lbl_profile".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 34.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgHome,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 24.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "lbl_home_page".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 33.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgFrameGray600,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 24.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "lbl_my_cart".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 33.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgFavoriteGray600,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: Text(
                                "lbl_favorite".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 34.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgFatsDelivery,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: Text(
                                "lbl_orders".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 34.v),
                        Container(
                          width: 145.h,
                          margin: EdgeInsets.only(right: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgNotifications,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                              Text(
                                "lbl_notifications".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50.v),
                        SizedBox(
                          width: 147.h,
                          child: Divider(
                            color: appTheme.blueGray800,
                          ),
                        ),
                        SizedBox(height: 48.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgArrowDown,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 24.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "lbl_sign_out".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgHome627x150,
                    width: 150.h,
                    radius: BorderRadius.circular(
                      25.h,
                    ),
                    margin: EdgeInsets.only(bottom: 44.v),
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
