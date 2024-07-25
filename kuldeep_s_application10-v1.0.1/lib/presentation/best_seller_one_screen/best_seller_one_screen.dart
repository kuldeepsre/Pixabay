import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_title.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/bestsellerone_item_widget.dart';
import 'models/bestsellerone_item_model.dart';
import 'models/best_seller_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/best_seller_one_bloc.dart';

class BestSellerOneScreen extends StatelessWidget {
  const BestSellerOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<BestSellerOneBloc>(
      create: (context) => BestSellerOneBloc(BestSellerOneState(
        bestSellerOneModelObj: BestSellerOneModel(),
      ))
        ..add(BestSellerOneInitialEvent()),
      child: BestSellerOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90001,
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            top: 18.v,
            right: 20.h,
          ),
          child: BlocSelector<BestSellerOneBloc, BestSellerOneState,
              BestSellerOneModel?>(
            selector: (state) => state.bestSellerOneModelObj,
            builder: (context, bestSellerOneModelObj) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 222.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 18.h,
                  crossAxisSpacing: 18.h,
                ),
                physics: BouncingScrollPhysics(),
                itemCount:
                    bestSellerOneModelObj?.bestselleroneItemList.length ?? 0,
                itemBuilder: (context, index) {
                  BestselleroneItemModel model =
                      bestSellerOneModelObj?.bestselleroneItemList[index] ??
                          BestselleroneItemModel();
                  return BestselleroneItemWidget(
                    model,
                  );
                },
              );
            },
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
        text: "lbl_best_sellers".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgFilterWhiteA700,
          margin: EdgeInsets.only(
            left: 20.h,
            top: 16.v,
            right: 16.h,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgSearchWhiteA70024x24,
          margin: EdgeInsets.only(
            left: 16.h,
            top: 16.v,
            right: 36.h,
          ),
        ),
      ],
    );
  }
}
