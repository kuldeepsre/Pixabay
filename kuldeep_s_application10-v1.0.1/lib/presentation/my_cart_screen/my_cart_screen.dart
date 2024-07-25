import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_title.dart';
import 'widgets/mycart_item_widget.dart';
import 'models/mycart_item_model.dart';
import 'models/my_cart_model.dart';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/my_cart_bloc.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<MyCartBloc>(
      create: (context) => MyCartBloc(MyCartState(
        myCartModelObj: MyCartModel(),
      ))
        ..add(MyCartInitialEvent()),
      child: MyCartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90001,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 18.v),
              _buildMyCart(context),
              Spacer(),
              _buildSubtotal(context),
            ],
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
        text: "lbl_my_cart".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildMyCart(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: BlocSelector<MyCartBloc, MyCartState, MyCartModel?>(
        selector: (state) => state.myCartModelObj,
        builder: (context, myCartModelObj) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 30.v,
              );
            },
            itemCount: myCartModelObj?.mycartItemList.length ?? 0,
            itemBuilder: (context, index) {
              MycartItemModel model =
                  myCartModelObj?.mycartItemList[index] ?? MycartItemModel();
              return MycartItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSubtotal(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 23.v,
      ),
      decoration: AppDecoration.fillGray900.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 7.h),
            child: _buildFrame(
              context,
              totalCost: "lbl_subtotal".tr,
              price: "lbl_1250_00".tr,
            ),
          ),
          SizedBox(height: 16.v),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: Text(
                    "lbl_shopping".tr,
                    style: CustomTextStyles.titleMediumGray600,
                  ),
                ),
                Text(
                  "lbl_40_90".tr,
                  style: CustomTextStyles.titleMedium18,
                ),
              ],
            ),
          ),
          SizedBox(height: 23.v),
          Divider(
            color: appTheme.gray90001,
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(right: 7.h),
            child: _buildFrame(
              context,
              totalCost: "lbl_total_cost".tr,
              price: "lbl_1690_99".tr,
            ),
          ),
          SizedBox(height: 22.v),
          CustomElevatedButton(
            text: "lbl_checkout".tr,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String totalCost,
    required String price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 1.v,
            bottom: 4.v,
          ),
          child: Text(
            totalCost,
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.whiteA700,
            ),
          ),
        ),
        Text(
          price,
          style: CustomTextStyles.titleLargeWhiteA700.copyWith(
            color: appTheme.whiteA700,
          ),
        ),
      ],
    );
  }
}
