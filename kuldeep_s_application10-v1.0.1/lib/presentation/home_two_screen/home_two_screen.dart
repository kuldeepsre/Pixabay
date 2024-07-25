import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_three.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_title_image.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:kuldeep_s_application10/widgets/custom_search_view.dart';
import 'package:kuldeep_s_application10/widgets/custom_text_form_field.dart';
import 'package:kuldeep_s_application10/widgets/custom_icon_button.dart';
import 'widgets/hometwo_item_widget.dart';
import 'models/hometwo_item_model.dart';
import 'models/home_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/home_two_bloc.dart';

class HomeTwoScreen extends StatelessWidget {
  const HomeTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeTwoBloc>(
      create: (context) => HomeTwoBloc(HomeTwoState(
        homeTwoModelObj: HomeTwoModel(),
      ))
        ..add(HomeTwoInitialEvent()),
      child: HomeTwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90001,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 13.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 5.v),
              BlocSelector<HomeTwoBloc, HomeTwoState, TextEditingController?>(
                selector: (state) => state.searchController,
                builder: (context, searchController) {
                  return CustomSearchView(
                    controller: searchController,
                    hintText: "msg_looking_for_shoes".tr,
                    borderDecoration: SearchViewStyleHelper.fillGray,
                    fillColor: appTheme.gray900,
                  );
                },
              ),
              SizedBox(height: 32.v),
              _buildCategories(context),
              SizedBox(height: 27.v),
              _buildFrame(
                context,
                newArrivals: "lbl_popular_shoes".tr,
                seeAll: "lbl_see_all".tr,
              ),
              SizedBox(height: 15.v),
              _buildHomeTwo(context),
              SizedBox(height: 25.v),
              _buildFrame(
                context,
                newArrivals: "lbl_new_arrivals".tr,
                seeAll: "lbl_see_all".tr,
              ),
              SizedBox(height: 17.v),
              _buildFrame3(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingIconbuttonThree(
        imagePath: ImageConstant.imgUserWhiteA700,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 6.v,
          bottom: 6.v,
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleFour(
            text: "lbl_store_location".tr,
            margin: EdgeInsets.symmetric(horizontal: 34.h),
          ),
          SizedBox(height: 4.v),
          Row(
            children: [
              AppbarTitleImage(
                imagePath: ImageConstant.imgHugeIconDevic,
                margin: EdgeInsets.only(
                  top: 1.v,
                  bottom: 3.v,
                ),
              ),
              AppbarSubtitleOne(
                text: "msg_mondolibug_sylhet".tr,
                margin: EdgeInsets.only(left: 4.h),
              ),
            ],
          ),
        ],
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgFrame31Gray900,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 6.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCategories(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocSelector<HomeTwoBloc, HomeTwoState, TextEditingController?>(
          selector: (state) => state.settingsController,
          builder: (context, settingsController) {
            return CustomTextFormField(
              width: 92.h,
              controller: settingsController,
              hintText: "lbl_nike".tr,
              hintStyle: theme.textTheme.titleSmall!,
              textInputAction: TextInputAction.done,
              prefix: Container(
                padding: EdgeInsets.fromLTRB(4.h, 10.v, 1.h, 8.v),
                margin: EdgeInsets.fromLTRB(6.h, 6.v, 8.h, 6.v),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    16.h,
                  ),
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgSettings,
                  height: 13.v,
                ),
              ),
              prefixConstraints: BoxConstraints(
                maxHeight: 44.v,
              ),
              contentPadding: EdgeInsets.only(
                top: 12.v,
                right: 16.h,
                bottom: 12.v,
              ),
              borderDecoration: TextFormFieldStyleHelper.fillPrimary,
              fillColor: theme.colorScheme.primary,
            );
          },
        ),
        CustomIconButton(
          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(5.h),
          decoration: IconButtonStyleHelper.fillGrayTL22,
          child: CustomImageView(
            imagePath: ImageConstant.imgFrame8,
          ),
        ),
        CustomIconButton(
          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(8.h),
          decoration: IconButtonStyleHelper.fillGrayTL22,
          child: CustomImageView(
            imagePath: ImageConstant.imgSettingsWhiteA700,
          ),
        ),
        CustomIconButton(
          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(8.h),
          decoration: IconButtonStyleHelper.fillGrayTL22,
          child: CustomImageView(
            imagePath: ImageConstant.imgGroup18WhiteA700,
          ),
        ),
        CustomIconButton(
          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(7.h),
          decoration: IconButtonStyleHelper.fillGrayTL22,
          child: CustomImageView(
            imagePath: ImageConstant.imgSearchWhiteA700,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildHomeTwo(BuildContext context) {
    return SizedBox(
      height: 201.v,
      child: BlocSelector<HomeTwoBloc, HomeTwoState, HomeTwoModel?>(
        selector: (state) => state.homeTwoModelObj,
        builder: (context, homeTwoModelObj) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 21.h,
              );
            },
            itemCount: homeTwoModelObj?.hometwoItemList.length ?? 0,
            itemBuilder: (context, index) {
              HometwoItemModel model =
                  homeTwoModelObj?.hometwoItemList[index] ?? HometwoItemModel();
              return HometwoItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame3(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: appTheme.gray900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Container(
        height: 120.v,
        width: 335.h,
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 1.v,
        ),
        decoration: AppDecoration.fillGray900.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgNikeAh80501101,
              height: 86.v,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 12.h),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 3.v,
                      bottom: 6.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_best_choice".tr.toUpperCase(),
                          style: CustomTextStyles.labelLargePrimary,
                        ),
                        SizedBox(height: 2.v),
                        Text(
                          "lbl_nike_air_jordan".tr,
                          style: CustomTextStyles.titleLargeWhiteA700,
                        ),
                        SizedBox(height: 10.v),
                        Text(
                          "lbl_849_69".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgNikeAh805011086x125,
                    height: 86.v,
                    margin: EdgeInsets.only(left: 17.h),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        height: 106.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgGroup123,
              height: 56.adaptSize,
              width: 56.adaptSize,
              alignment: Alignment.topCenter,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgGroup124Gray900,
              height: 106.v,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String newArrivals,
    required String seeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          newArrivals,
          style: CustomTextStyles.titleMedium_1.copyWith(
            color: appTheme.whiteA700,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: Text(
            seeAll,
            style: CustomTextStyles.bodyMediumPrimary.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
