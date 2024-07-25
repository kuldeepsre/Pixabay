import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/bestseller_item_widget.dart';
import 'models/bestseller_item_model.dart';
import 'models/best_seller_model.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/best_seller_bloc.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<BestSellerBloc>(
      create: (context) => BestSellerBloc(BestSellerState(
        bestSellerModelObj: BestSellerModel(),
      ))
        ..add(BestSellerInitialEvent()),
      child: BestSellerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.only(
            left: 20.h,
            top: 18.v,
            right: 20.h,
          ),
          child:
              BlocSelector<BestSellerBloc, BestSellerState, BestSellerModel?>(
            selector: (state) => state.bestSellerModelObj,
            builder: (context, bestSellerModelObj) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 222.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 18.h,
                  crossAxisSpacing: 18.h,
                ),
                physics: BouncingScrollPhysics(),
                itemCount: bestSellerModelObj?.bestsellerItemList.length ?? 0,
                itemBuilder: (context, index) {
                  BestsellerItemModel model =
                      bestSellerModelObj?.bestsellerItemList[index] ??
                          BestsellerItemModel();
                  return BestsellerItemWidget(
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
        text: "lbl_best_sellers".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgFilter,
          margin: EdgeInsets.only(
            left: 20.h,
            top: 16.v,
            right: 16.h,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgSearchGray9000224x24,
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
