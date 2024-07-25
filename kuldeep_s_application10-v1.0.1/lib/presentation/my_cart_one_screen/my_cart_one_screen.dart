import 'package:kuldeep_s_application10/widgets/app_bar/custom_app_bar.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:kuldeep_s_application10/widgets/app_bar/appbar_subtitle.dart';
import 'widgets/mycartone_item_widget.dart';
import 'models/mycartone_item_model.dart';
import 'models/my_cart_one_model.dart';
import 'package:kuldeep_s_application10/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';
import 'bloc/my_cart_one_bloc.dart';

class MyCartOneScreen extends StatelessWidget {
  const MyCartOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<MyCartOneBloc>(
      create: (context) => MyCartOneBloc(MyCartOneState(
        myCartOneModelObj: MyCartOneModel(),
      ))
        ..add(MyCartOneInitialEvent()),
      child: MyCartOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 18.v),
              _buildMyCartOne(context),
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
        text: "lbl_my_cart".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildMyCartOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: BlocSelector<MyCartOneBloc, MyCartOneState, MyCartOneModel?>(
        selector: (state) => state.myCartOneModelObj,
        builder: (context, myCartOneModelObj) {
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
            itemCount: myCartOneModelObj?.mycartoneItemList.length ?? 0,
            itemBuilder: (context, index) {
              MycartoneItemModel model =
                  myCartOneModelObj?.mycartoneItemList[index] ??
                      MycartoneItemModel();
              return MycartoneItemWidget(
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
      decoration: AppDecoration.fillWhiteA.copyWith(
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
                  style: CustomTextStyles.titleMediumGray90002,
                ),
              ],
            ),
          ),
          SizedBox(height: 23.v),
          Divider(
            color: appTheme.gray200,
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
            style: CustomTextStyles.titleMediumGray90002_1.copyWith(
              color: appTheme.gray90002,
            ),
          ),
        ),
        Text(
          price,
          style: CustomTextStyles.titleLargeGray90002.copyWith(
            color: appTheme.gray90002,
          ),
        ),
      ],
    );
  }
}
