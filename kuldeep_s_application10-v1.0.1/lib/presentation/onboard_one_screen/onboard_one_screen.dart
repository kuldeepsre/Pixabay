import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'models/onboard_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/onboard_one_bloc.dart';

class OnboardOneScreen extends StatelessWidget {
  const OnboardOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardOneBloc>(
      create: (context) => OnboardOneBloc(OnboardOneState(
        onboardOneModelObj: OnboardOneModel(),
      ))
        ..add(OnboardOneInitialEvent()),
      child: OnboardOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardOneBloc, OnboardOneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray90002,
            body: SizedBox(
              height: 768.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgNikeGray900,
                    height: 116.v,
                    radius: BorderRadius.circular(
                      2.h,
                    ),
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 149.v),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup284Gray900,
                    height: 311.v,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      left: 20.h,
                      top: 102.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse9062,
                    height: 163.v,
                    alignment: Alignment.topRight,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 89.v,
                        right: 14.h,
                        bottom: 5.v,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath:
                                ImageConstant.imgDigitalSketchesPrevUi256x360,
                            height: 256.v,
                          ),
                          Spacer(),
                          Container(
                            width: 258.h,
                            margin: EdgeInsets.only(
                              left: 20.h,
                              right: 82.h,
                            ),
                            child: Text(
                              "msg_start_journey_with".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.displayMedium!.copyWith(
                                height: 1.40,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.v),
                          Container(
                            width: 287.h,
                            margin: EdgeInsets.only(
                              left: 20.h,
                              right: 52.h,
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
  Widget _buildGetStarted(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 5.h,
        ),
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
