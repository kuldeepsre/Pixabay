import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'models/onboard_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/onboard_three_bloc.dart';

class OnboardThreeScreen extends StatelessWidget {
  const OnboardThreeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardThreeBloc>(
      create: (context) => OnboardThreeBloc(OnboardThreeState(
        onboardThreeModelObj: OnboardThreeModel(),
      ))
        ..add(OnboardThreeInitialEvent()),
      child: OnboardThreeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardThreeBloc, OnboardThreeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              height: 768.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse9061,
                    height: 163.v,
                    alignment: Alignment.topRight,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 643.v,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(bottom: 5.v),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildSpringPrevUiTwo(context),
                                SizedBox(height: 30.v),
                                Container(
                                  width: 281.h,
                                  margin: EdgeInsets.only(
                                    left: 20.h,
                                    right: 73.h,
                                  ),
                                  child: Text(
                                    "msg_summer_shoes_nike".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .displayMediumGray90002
                                        .copyWith(
                                      height: 1.40,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 9.v),
                                Container(
                                  width: 280.h,
                                  margin: EdgeInsets.only(
                                    left: 20.h,
                                    right: 73.h,
                                  ),
                                  child: Text(
                                    "msg_amet_minim_lit_nodeseru".tr,
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
                          CustomImageView(
                            imagePath: ImageConstant.imgGroup284,
                            height: 311.v,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                              left: 20.h,
                              top: 17.v,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgNike,
                            height: 116.v,
                            radius: BorderRadius.circular(
                              2.h,
                            ),
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 64.v),
                          ),
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
  Widget _buildSpringPrevUiTwo(BuildContext context) {
    return SizedBox(
      height: 330.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Opacity(
            opacity: 0.3,
            child: CustomImageView(
              imagePath: ImageConstant.imgSpringPrevUi2,
              height: 192.v,
              alignment: Alignment.bottomRight,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgSpringPrevUi1,
            height: 268.v,
            alignment: Alignment.topLeft,
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
