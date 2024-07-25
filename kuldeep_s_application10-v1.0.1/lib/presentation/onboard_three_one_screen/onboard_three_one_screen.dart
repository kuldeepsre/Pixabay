import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'models/onboard_three_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/onboard_three_one_bloc.dart';

class OnboardThreeOneScreen extends StatelessWidget {
  const OnboardThreeOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardThreeOneBloc>(
      create: (context) => OnboardThreeOneBloc(OnboardThreeOneState(
        onboardThreeOneModelObj: OnboardThreeOneModel(),
      ))
        ..add(OnboardThreeOneInitialEvent()),
      child: OnboardThreeOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardThreeOneBloc, OnboardThreeOneState>(
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
                    imagePath: ImageConstant.imgEllipse9064,
                    height: 163.v,
                    alignment: Alignment.topRight,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 11.h,
                        bottom: 5.v,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgSpringPrevUi1,
                            height: 268.v,
                          ),
                          SizedBox(height: 92.v),
                          Container(
                            width: 281.h,
                            margin: EdgeInsets.only(
                              left: 20.h,
                              right: 61.h,
                            ),
                            child: Text(
                              "msg_summer_shoes_nike".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.displayMedium!.copyWith(
                                height: 1.40,
                              ),
                            ),
                          ),
                          SizedBox(height: 9.v),
                          Container(
                            width: 280.h,
                            margin: EdgeInsets.only(
                              left: 20.h,
                              right: 61.h,
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
  Widget _buildNext(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 8.h,
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
              width: 105.h,
              text: "lbl_next".tr,
            ),
          ],
        ),
      ),
    );
  }
}
