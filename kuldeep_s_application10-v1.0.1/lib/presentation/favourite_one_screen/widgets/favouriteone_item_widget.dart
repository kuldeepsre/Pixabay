import '../models/favouriteone_item_model.dart';
import 'package:kuldeep_s_application10/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class FavouriteoneItemWidget extends StatelessWidget {
  FavouriteoneItemWidget(
    this.favouriteoneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FavouriteoneItemModel favouriteoneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 90.v,
            width: 128.h,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                CustomImageView(
                  imagePath: favouriteoneItemModelObj?.bestSeller,
                  height: 81.v,
                  alignment: Alignment.bottomCenter,
                ),
                CustomIconButton(
                  height: 28.adaptSize,
                  width: 28.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  decoration: IconButtonStyleHelper.fillGray,
                  alignment: Alignment.topLeft,
                  child: CustomImageView(
                    imagePath: favouriteoneItemModelObj?.favorite,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              favouriteoneItemModelObj.bestSeller1!,
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 3.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              favouriteoneItemModelObj.nikeJordan!,
              style: CustomTextStyles.titleMediumGray90002_1,
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Row(
              children: [
                Text(
                  favouriteoneItemModelObj.price!,
                  style: CustomTextStyles.titleMediumGray90002_1,
                ),
                CustomImageView(
                  imagePath: favouriteoneItemModelObj?.image,
                  height: 16.v,
                  margin: EdgeInsets.only(
                    left: 45.h,
                    bottom: 3.v,
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
