import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_title.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'models/details_model.dart';
import 'models/frame2_item_model.dart';
import '../details_screen/widgets/frame2_item_widget.dart';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/details_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (context) => DetailsBloc(DetailsState(
        detailsModelObj: DetailsModel(),
      ))
        ..add(DetailsInitialEvent()),
      child: DetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90001,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 10.v),
            child: Column(
              children: [
                _buildShoeImag(context),
                SizedBox(height: 16.v),
                Container(
                  decoration: AppDecoration.fillGray900.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "lbl_best_seller".tr.toUpperCase(),
                          style: CustomTextStyles.bodyMediumPrimary_1,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "lbl_nike_air_jordan".tr,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "lbl_967_800".tr,
                          style: CustomTextStyles.titleLargeWhiteA700,
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Container(
                        width: 289.h,
                        margin: EdgeInsets.only(
                          left: 20.h,
                          right: 65.h,
                        ),
                        child: Text(
                          "msg_air_jordan_is_an".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            height: 1.57,
                          ),
                        ),
                      ),
                      SizedBox(height: 14.v),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "lbl_gallery".tr,
                          style: CustomTextStyles.titleMedium18,
                        ),
                      ),
                      SizedBox(height: 13.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgFrame151,
                        height: 56.v,
                        margin: EdgeInsets.only(left: 20.h),
                      ),
                      SizedBox(height: 14.v),
                      _buildFrame(context),
                      SizedBox(height: 15.v),
                      _buildFrame1(context),
                      SizedBox(height: 24.v),
                      _buildFrame2(context),
                    ],
                  ),
                ),
              ],
            ),
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
        text: "lbl_men_s_shoes".tr,
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgFrame31Gray900,
          margin: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 6.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildShoeImag(BuildContext context) {
    return SizedBox(
      height: 202.v,
      width: 311.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup136Primary,
            height: 65.v,
            alignment: Alignment.bottomCenter,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgNikeZoomWinfl1,
            height: 160.v,
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 18.h,
          right: 24.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "lbl_size".tr,
              style: CustomTextStyles.titleMedium18,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text(
                "lbl_eu".tr,
                style: theme.textTheme.titleSmall,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 3.v,
              ),
              child: Text(
                "lbl_us".tr,
                style: CustomTextStyles.titleSmallGray600,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 3.v,
              ),
              child: Text(
                "lbl_uk".tr,
                style: CustomTextStyles.titleSmallGray600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame1(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: BlocSelector<DetailsBloc, DetailsState, DetailsModel?>(
        selector: (state) => state.detailsModelObj,
        builder: (context, detailsModelObj) {
          return Wrap(
            runSpacing: 13.v,
            spacing: 13.h,
            children: List<Widget>.generate(
              detailsModelObj?.frame2ItemList.length ?? 0,
              (index) {
                Frame2ItemModel model =
                    detailsModelObj?.frame2ItemList[index] ?? Frame2ItemModel();

                return Frame2ItemWidget(
                  model,
                  onSelectedChipView: (value) {
                    context.read<DetailsBloc>().add(
                        UpdateChipViewEvent(index: index, isSelected: value));
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame2(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlineErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 7.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_price".tr,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 5.v),
                Text(
                  "lbl_849_69".tr,
                  style: CustomTextStyles.titleLargeWhiteA700,
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            width: 167.h,
            text: "lbl_add_to_cart".tr,
            margin: EdgeInsets.only(bottom: 7.v),
          ),
        ],
      ),
    );
  }
}
