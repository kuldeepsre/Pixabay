import 'models/app_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/app_navigation_bloc.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0XFFFFFFFF),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildAppNavigation(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "Splash".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.splashScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboard-One One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardOneOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboard-Two".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.onboardTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboard-Three".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardThreeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Sign In One".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signInOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Sign Up".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signUpScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Foget Password One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.fogetPasswordOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Home".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.homeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Details One".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.detailsOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Favourite One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.favouriteOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "My Cart One".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.myCartOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Checkout Three".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.checkoutThreeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Notifications One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.notificationsOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Best Seller".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.bestSellerScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Side Menu One".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.sideMenuOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Account & Settings".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.accountSettingsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Profile".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.profileScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Search One".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.searchOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Splash One".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.splashOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboard-One".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.onboardOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboard-Two One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardTwoOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboard-Three One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardThreeOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Sign In".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signInScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Sign Up One".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signUpOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Foget Password".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.fogetPasswordScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Home Two".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.homeTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Details".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.detailsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Favourite".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.favouriteScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "My Cart".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.myCartScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Checkout Two".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.checkoutTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Notifications".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.notificationsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Best Seller One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.bestSellerOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Side Menu".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.sideMenuScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Account & Settings One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.accountSettingsOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Profile One".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.profileOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Search".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.searchScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
