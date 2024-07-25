import '../models/home_item_model.dart';
import 'package:kuldeep_s_application10/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class HomeItemWidget extends StatelessWidget {
  HomeItemWidget(
    this.homeItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HomeItemModel homeItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      width: 157.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.v),
          CustomImageView(
            imagePath: homeItemModelObj?.bestSeller,
            height: 81.v,
            alignment: Alignment.center,
          ),
          SizedBox(height: 19.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              homeItemModelObj.bestSeller1!,
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 3.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              homeItemModelObj.nikeJordan!,
              style: CustomTextStyles.titleMediumGray90002_1,
            ),
          ),
          SizedBox(height: 3.v),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 6.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    homeItemModelObj.price!,
                    style: CustomTextStyles.titleSmallGray90002,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 57.h),
                  child: CustomIconButton(
                    height: 35.v,
                    width: 34.h,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgClosePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
