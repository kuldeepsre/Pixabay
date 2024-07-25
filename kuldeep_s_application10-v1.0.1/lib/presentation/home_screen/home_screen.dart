import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_title_image.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:kuldeep_s_application10/widgets/custom_search_view.dart';
import 'package:kuldeep_s_application10/widgets/custom_text_form_field.dart';
import 'package:kuldeep_s_application10/widgets/custom_icon_button.dart';
import 'widgets/home_item_widget.dart';
import 'models/home_item_model.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              BlocSelector<HomeBloc, HomeState, TextEditingController?>(
                selector: (state) => state.searchController,
                builder: (context, searchController) {
                  return CustomSearchView(
                    controller: searchController,
                    hintText: "msg_looking_for_shoes".tr,
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
              _buildHome(context),
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
      leading: AppbarLeadingIconbuttonOne(
        imagePath: ImageConstant.imgUser,
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
              AppbarSubtitleThree(
                text: "msg_mondolibug_sylhet".tr,
                margin: EdgeInsets.only(left: 4.h),
              ),
            ],
          ),
        ],
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgFrame31,
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
        BlocSelector<HomeBloc, HomeState, TextEditingController?>(
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
          child: CustomImageView(
            imagePath: ImageConstant.imgGroup10,
          ),
        ),
        CustomIconButton(
          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(8.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgSettingsGray90002,
          ),
        ),
        CustomIconButton(
          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(8.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgGroup18,
          ),
        ),
        CustomIconButton(
          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(7.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgSearchGray90002,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildHome(BuildContext context) {
    return SizedBox(
      height: 201.v,
      child: BlocSelector<HomeBloc, HomeState, HomeModel?>(
        selector: (state) => state.homeModelObj,
        builder: (context, homeModelObj) {
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
            itemCount: homeModelObj?.homeItemList.length ?? 0,
            itemBuilder: (context, index) {
              HomeItemModel model =
                  homeModelObj?.homeItemList[index] ?? HomeItemModel();
              return HomeItemWidget(
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
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 1.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 19.v),
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
                  style: CustomTextStyles.titleLargeGray90002,
                ),
                SizedBox(height: 10.v),
                Text(
                  "lbl_849_69".tr,
                  style: CustomTextStyles.titleMediumGray90002_1,
                ),
              ],
            ),
          ),
          Container(
            height: 101.v,
            width: 129.h,
            margin: EdgeInsets.only(
              top: 16.v,
              right: 8.h,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgNikeAh8050110,
                  height: 86.v,
                  alignment: Alignment.bottomLeft,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgNikeAh805011086x125,
                  height: 86.v,
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
          ),
        ],
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
              imagePath: ImageConstant.imgGroup124,
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
          style: CustomTextStyles.titleMediumGray90002_2.copyWith(
            color: appTheme.gray90002,
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
