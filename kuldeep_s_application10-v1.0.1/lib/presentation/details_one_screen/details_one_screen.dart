import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'widgets/detailsone_item_widget.dart';
import 'models/detailsone_item_model.dart';
import 'models/details_one_model.dart';
import 'models/frame_item_model.dart';
import '../details_one_screen/widgets/frame_item_widget.dart';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/details_one_bloc.dart';

class DetailsOneScreen extends StatelessWidget {
  const DetailsOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<DetailsOneBloc>(
      create: (context) => DetailsOneBloc(DetailsOneState(
        detailsOneModelObj: DetailsOneModel(),
      ))
        ..add(DetailsOneInitialEvent()),
      child: DetailsOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  decoration: AppDecoration.fillWhiteA.copyWith(
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
                          style: CustomTextStyles.headlineSmallGray90002,
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "lbl_967_800".tr,
                          style: CustomTextStyles.titleLargeGray90002,
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
                          style: CustomTextStyles.titleMediumGray90002,
                        ),
                      ),
                      SizedBox(height: 13.v),
                      _buildDetailsOne(context),
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
        text: "lbl_men_s_shoes".tr,
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgFrame31,
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
            imagePath: ImageConstant.imgGroup136,
            height: 65.v,
            alignment: Alignment.bottomCenter,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgNikeZoomWinfl160x253,
            height: 160.v,
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDetailsOne(BuildContext context) {
    return SizedBox(
      height: 56.v,
      child: BlocSelector<DetailsOneBloc, DetailsOneState, DetailsOneModel?>(
        selector: (state) => state.detailsOneModelObj,
        builder: (context, detailsOneModelObj) {
          return ListView.separated(
            padding: EdgeInsets.only(
              left: 20.h,
              right: 155.h,
            ),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 16.h,
              );
            },
            itemCount: detailsOneModelObj?.detailsoneItemList.length ?? 0,
            itemBuilder: (context, index) {
              DetailsoneItemModel model =
                  detailsOneModelObj?.detailsoneItemList[index] ??
                      DetailsoneItemModel();
              return DetailsoneItemWidget(
                model,
              );
            },
          );
        },
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
              style: CustomTextStyles.titleMediumGray90002,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text(
                "lbl_eu".tr,
                style: CustomTextStyles.titleSmallGray90002,
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
      child: BlocSelector<DetailsOneBloc, DetailsOneState, DetailsOneModel?>(
        selector: (state) => state.detailsOneModelObj,
        builder: (context, detailsOneModelObj) {
          return Wrap(
            runSpacing: 13.v,
            spacing: 13.h,
            children: List<Widget>.generate(
              detailsOneModelObj?.frameItemList.length ?? 0,
              (index) {
                FrameItemModel model =
                    detailsOneModelObj?.frameItemList[index] ??
                        FrameItemModel();

                return FrameItemWidget(
                  model,
                  onSelectedChipView: (value) {
                    context.read<DetailsOneBloc>().add(
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
      decoration: AppDecoration.outlineIndigoE.copyWith(
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
                  style: CustomTextStyles.titleLargeGray90002,
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
