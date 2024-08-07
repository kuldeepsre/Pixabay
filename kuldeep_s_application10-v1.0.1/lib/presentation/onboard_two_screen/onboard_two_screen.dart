import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'models/onboard_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/onboard_two_bloc.dart';

class OnboardTwoScreen extends StatelessWidget {
  const OnboardTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardTwoBloc>(
      create: (context) => OnboardTwoBloc(OnboardTwoState(
        onboardTwoModelObj: OnboardTwoModel(),
      ))
        ..add(OnboardTwoInitialEvent()),
      child: OnboardTwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardTwoBloc, OnboardTwoState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              height: 768.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 13.adaptSize,
                      width: 13.adaptSize,
                      margin: EdgeInsets.only(
                        right: 40.h,
                        bottom: 355.v,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(
                          6.h,
                        ),
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgNike,
                    height: 116.v,
                    radius: BorderRadius.circular(
                      2.h,
                    ),
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 149.v),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup284Blue20001,
                    width: 43.h,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      left: 20.h,
                      top: 102.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse906163x181,
                    height: 163.v,
                    alignment: Alignment.topRight,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.v),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAfdfedfdZero(context),
                          SizedBox(height: 45.v),
                          Container(
                            width: 249.h,
                            margin: EdgeInsets.only(left: 20.h),
                            child: Text(
                              "msg_follow_latest_style".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.displayMediumGray90002
                                  .copyWith(
                                height: 1.40,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.v),
                          Container(
                            width: 283.h,
                            margin: EdgeInsets.only(
                              left: 20.h,
                              right: 71.h,
                            ),
                            child: Text(
                              "msg_there_are_many_beautiful".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleLarge!.copyWith(
                                height: 1.60,
                              ),
                            ),
                          ),
                          SizedBox(height: 43.v),
                          _buildNext(context),
                        ],
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
  Widget _buildAfdfedfdZero(BuildContext context) {
    return SizedBox(
      height: 301.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Opacity(
            opacity: 0.3,
            child: CustomImageView(
              imagePath: ImageConstant.img81a48fdfedf49d0,
              height: 245.v,
              alignment: Alignment.bottomRight,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.img81a48fdfedf49d0248x364,
            height: 248.v,
            alignment: Alignment.topCenter,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEllipse907,
            height: 125.v,
            radius: BorderRadius.circular(
              65.h,
            ),
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(
              right: 34.h,
              bottom: 30.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 5.v,
              margin: EdgeInsets.only(
                top: 25.v,
                bottom: 24.v,
              ),
              child: AnimatedSmoothIndicator(
                activeIndex: 0,
                count: 3,
                effect: ScrollingDotsEffect(
                  spacing: 8,
                  activeDotColor: theme.colorScheme.primary,
                  dotColor: appTheme.indigo50,
                  dotHeight: 5.v,
                  dotWidth: 8.h,
                ),
              ),
            ),
            CustomElevatedButton(
              width: 105.h,
              text: "lbl_next".tr,
            ),
          ],
        ),
      ),
    );
  }
}
