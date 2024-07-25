import '../models/favourite_item_model.dart';
import 'package:kuldeep_s_application10/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:kuldeep_s_application10/core/app_export.dart';

// ignore: must_be_immutable
class FavouriteItemWidget extends StatelessWidget {
  FavouriteItemWidget(
    this.favouriteItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FavouriteItemModel favouriteItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillGray900.copyWith(
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
                  imagePath: favouriteItemModelObj?.bestSeller,
                  height: 81.v,
                  alignment: Alignment.bottomCenter,
                ),
                CustomIconButton(
                  height: 28.adaptSize,
                  width: 28.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  decoration: IconButtonStyleHelper.fillGrayTL14,
                  alignment: Alignment.topLeft,
                  child: CustomImageView(
                    imagePath: favouriteItemModelObj?.favorite,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              favouriteItemModelObj.bestSeller1!,
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 3.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              favouriteItemModelObj.nikeJordan!,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Row(
              children: [
                Text(
                  favouriteItemModelObj.price!,
                  style: theme.textTheme.titleMedium,
                ),
                CustomImageView(
                  imagePath: favouriteItemModelObj?.image,
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
