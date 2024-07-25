import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'models/onboard_one_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/onboard_one_one_bloc.dart';

class OnboardOneOneScreen extends StatelessWidget {
  const OnboardOneOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardOneOneBloc>(
      create: (context) => OnboardOneOneBloc(OnboardOneOneState(
        onboardOneOneModelObj: OnboardOneOneModel(),
      ))
        ..add(OnboardOneOneInitialEvent()),
      child: OnboardOneOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardOneOneBloc, OnboardOneOneState>(
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
                    imagePath: ImageConstant.imgEllipse906,
                    height: 163.v,
                    alignment: Alignment.topRight,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 639.v,
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
                                _buildWidget(context),
                                SizedBox(height: 36.v),
                                Container(
                                  width: 258.h,
                                  margin: EdgeInsets.only(left: 20.h),
                                  child: Text(
                                    "msg_start_journey_with".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .displayMediumGray90002
                                        .copyWith(
                                      height: 1.40,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.v),
                                Container(
                                  width: 287.h,
                                  margin: EdgeInsets.only(
                                    left: 20.h,
                                    right: 67.h,
                                  ),
                                  child: Text(
                                    "msg_smart_gorgeous".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      height: 1.60,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 43.v),
                                _buildGetStarted(context),
                              ],
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgGroup284,
                            height: 311.v,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                              left: 20.h,
                              top: 13.v,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgNike,
                            height: 116.v,
                            radius: BorderRadius.circular(
                              2.h,
                            ),
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 60.v),
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
  Widget _buildWidget(BuildContext context) {
    return SizedBox(
      height: 321.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Opacity(
            opacity: 0.3,
            child: CustomImageView(
              imagePath: ImageConstant.imgDigitalSketchesPrevUi,
              height: 193.v,
              alignment: Alignment.bottomRight,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgDigitalSketchesPrevUi256x360,
            height: 256.v,
            alignment: Alignment.topLeft,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGetStarted(BuildContext context) {
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
              width: 165.h,
              text: "lbl_get_started".tr,
            ),
          ],
        ),
      ),
    );
  }
}
